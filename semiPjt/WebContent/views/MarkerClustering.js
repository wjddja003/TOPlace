/**
 * Copyright 2016 NAVER Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * ��Ŀ Ŭ�����͸��� �����մϴ�.
 * @param {Object} options ��Ŀ Ŭ�����͸� �ɼ�
 */
var MarkerClustering = function(options) {
	// �⺻ ���Դϴ�.
	this.DEFAULT_OPTIONS = {
		// Ŭ������ ��Ŀ�� �ø� �����Դϴ�.
		map: null,
		// Ŭ������ ��Ŀ�� ������ ��Ŀ�Դϴ�.
		markers: [],
		// Ŭ������ ��Ŀ Ŭ�� �� �� ���� �����Դϴ�.
		disableClickZoom: true,
		// Ŭ�����͸� ������ �ּ� ��Ŀ ���Դϴ�.
		minClusterSize: 2,
		// Ŭ������ ��Ŀ�� ǥ���� �ִ� �� �����Դϴ�. �ش� �� �������� ������, Ŭ�����͸� �����ϰ� �ִ� ��Ŀ�� �����մϴ�.
		maxZoom: 8,
		// Ŭ�����͸� ������ �׸��� ũ���Դϴ�. ������ �ȼ��Դϴ�.
		gridSize: 100,
		// Ŭ������ ��Ŀ�� �������Դϴ�. NAVER Maps JavaScript API v3���� �����ϴ� ������, �ɺ�, HTML ��Ŀ ������ ��� ����� �� �ֽ��ϴ�.
		icons: [],
		// Ŭ������ ��Ŀ�� ������ �迭���� � �������� ������ ������ �ε����� �����մϴ�.
		indexGenerator: [10, 100, 200, 500, 1000],
		// Ŭ������ ��Ŀ�� ��ġ�� Ŭ�����͸� �����ϰ� �ִ� ��Ŀ�� ��� ��ǥ�� �� ������ �����Դϴ�.
		averageCenter: false,
		// Ŭ������ ��Ŀ�� ������ �� ȣ���ϴ� �ݹ��Լ��Դϴ�. �� �Լ��� ���� Ŭ������ ��Ŀ�� ������ ǥ���ϴ� ���� ������Ʈ�� ������ �� �ֽ��ϴ�.
		stylingFunction: function() {}
	};

	this._clusters = [];
	
	this._mapRelations = null;
	this._markerRelations = [];

	this.setOptions(naver.maps.Util.extend({}, this.DEFAULT_OPTIONS, options), true);
	this.setMap(options.map || null);
};

naver.maps.Util.ClassExtend(MarkerClustering, naver.maps.OverlayView, {
	onAdd: function() {
		var map = this.getMap();

		this._mapRelations = naver.maps.Event.addListener(map, 'idle', naver.maps.Util.bind(this._onIdle, this));

		if (this.getMarkers().length > 0) {
			this._createClusters();
			this._updateClusters();			
		}
	},

	draw: naver.maps.Util.noop,

	onRemove: function() {
		naver.maps.Event.removeListener(this._mapRelation);

		this._clearClusters();

		this._geoTree = null;
		this._mapRelation = null;
	},

	/**
	 * ��Ŀ Ŭ�����͸� �ɼ��� �����մϴ�. ������ �ɼǸ� �ݿ��˴ϴ�.
	 * @param {Object | string} newOptions �ɼ�
	 */
	setOptions: function(newOptions) {
		
		var _this = this;

		if (typeof newOptions === 'string') {
			var key = newOptions,
				value = arguments[1];

			_this.set(key, value);
		} else {
			var isFirst = arguments[1];

			naver.maps.Util.forEach(newOptions, function(value, key) {
				if (key !== 'map') {
					_this.set(key, value);
				}
			});

			if (newOptions.map && !isFirst) {
				_this.setMap(newOptions.map);
			}
		}
	},

	/**
	 * ��Ŀ Ŭ�����͸� �ɼ��� ��ȯ�մϴ�. Ư�� �ɼ� �̸��� �������� ������, ��� �ɼ��� ��ȯ�մϴ�.
	 * @param {string} key ��ȯ���� �ɼ� �̸�
	 * @return {Any} �ɼ�
	 */
	getOptions: function(key) {
		var _this = this,
			options = {};

		if (key !== undefined) {
			return _this.get(key);
		} else {
			naver.maps.Util.forEach(_this.DEFAULT_OPTIONS, function(value, key) {
				options[key] = _this.get(key);
			});

			return options;
		}
	},

	/**
	 * Ŭ�����͸� �����ϴ� �ּ� ��Ŀ ���� ��ȯ�մϴ�.
	 * @return {number} Ŭ�����͸� �����ϴ� �ּ� ��Ŀ ��
	 */
	getMinClusterSize: function() {
		return this.getOptions('minClusterSize');
	},

	/**
	 * Ŭ�����͸� �����ϴ� �ּ� ��Ŀ ���� �����մϴ�.
	 * @param {number} size Ŭ�����͸� �����ϴ� �ּ� ��Ŀ ��
	 */
	setMinClusterSize: function(size) {
		this.setOptions('minClusterSize', size);
	},

	/**
	 * Ŭ������ ��Ŀ�� ������ �ִ� �� ������ ��ȯ�մϴ�.
	 * @return {number} Ŭ������ ��Ŀ�� ������ �ִ� �� ����
	 */
	getMaxZoom: function() {
		return this.getOptions('maxZoom');
	},

	/**
	 * Ŭ������ ��Ŀ�� ������ �ִ� �� ������ �����մϴ�.
	 * @param {number} zoom Ŭ������ ��Ŀ�� ������ �ִ� �� ����
	 */
	setMaxZoom: function(zoom) {
		this.setOptions('maxZoom', zoom);
	},

	/**
	 * Ŭ�����͸� ������ �׸��� ũ�⸦ ��ȯ�մϴ�. ������ �ȼ��Դϴ�.
	 * @return {number} Ŭ�����͸� ������ �׸��� ũ��
	 */
	getGridSize: function() {
		return this.getOptions('gridSize');
	},

	/**
	 * Ŭ�����͸� ������ �׸��� ũ�⸦ �����մϴ�. ������ �ȼ��Դϴ�.
	 * @param {number} size Ŭ�����͸� ������ �׸��� ũ��
	 */
	setGridSize: function(size) {
		this.setOptions('gridSize', size);
	},

	/**
	 * Ŭ������ ��Ŀ�� �������� �����ϴ� �ε��� �����⸦ ��ȯ�մϴ�.
	 * @return {Array | Function} �ε��� ������
	 */
	getIndexGenerator: function() {
		return this.getOptions('indexGenerator');
	},

	/**
	 * Ŭ������ ��Ŀ�� �������� �����ϴ� �ε��� �����⸦ �����մϴ�.
	 * @param {Array | Function} indexGenerator �ε��� ������
	 */
	setIndexGenerator: function(indexGenerator) {
		this.setOptions('indexGenerator', indexGenerator);
	},

	/**
	 * Ŭ�����ͷ� ������ ��Ŀ�� ��ȯ�մϴ�.
	 * @return {Array.<naver.maps.Marker>} Ŭ�����ͷ� ������ ��Ŀ
	 */
	getMarkers: function() {
		return this.getOptions('markers');
	},

	/**
	 * Ŭ�����ͷ� ������ ��Ŀ�� �����մϴ�.
	 * @param {Array.<naver.maps.Marker>} markers Ŭ�����ͷ� ������ ��Ŀ
	 */
	setMarkers: function(markers) {
		this.setOptions('markers', markers);
	},

	/**
	 * Ŭ������ ��Ŀ �������� ��ȯ�մϴ�.
	 * @return {Array.<naver.maps.Marker~ImageIcon | naver.maps.Marker~SymbolIcon | naver.maps.Marker~HtmlIcon>} Ŭ������ ��Ŀ ������
	 */
	getIcons: function() {
		return this.getOptions('icons');
	},

	/**
	 * Ŭ������ ��Ŀ �������� �����մϴ�.
	 * @param {Array.<naver.maps.Marker~ImageIcon | naver.maps.Marker~SymbolIcon | naver.maps.Marker~HtmlIcon>} icons Ŭ������ ��Ŀ ������
	 */
	setIcons: function(icons) {
		this.setOptions('icons', icons);
	},

	/**
	 * Ŭ������ ��Ŀ�� ������Ʈ�� ������ �� �ִ� ��Ÿ�ϸ� �Լ��� ��ȯ�մϴ�.
	 * @return {Funxtion} �ݹ��Լ�
	 */
	getStylingFunction: function() {
		return this.getOptions('stylingFunction');
	},

	/**
	 * Ŭ������ ��Ŀ�� ������Ʈ�� ������ �� �ִ� ��Ÿ�ϸ� �Լ��� �����մϴ�.
	 * @param {Function} func �ݹ��Լ�
	 */
	setStylingFunction: function(func) {
		this.setOptions('stylingFunction', func);
	},

	/**
	 * Ŭ������ ��Ŀ�� Ŭ������ �� �� ���� ���� ���θ� ��ȯ�մϴ�.
	 * @return {boolean} �� ���� ���� ����
	 */
	getDisableClickZoom: function() {
		return this.getOptions('disableClickZoom');
	},

	/**
	 * Ŭ������ ��Ŀ�� Ŭ������ �� �� ���� ���� ���θ� �����մϴ�.
	 * @param {boolean} flag �� ���� ���� ����
	 */
	setDisableClickZoom: function(flag) {
		this.setOptions('disableClickZoom', flag);
	},

	/**
	 * Ŭ������ ��Ŀ�� ��ġ�� Ŭ�����͸� �����ϰ� �ִ� ��Ŀ�� ��� ��ǥ�� �� ������ ���θ� ��ȯ�մϴ�.
	 * @return {boolean} ��� ��ǥ�� Ŭ�����͸� ����
	 */
	getAverageCenter: function() {
		return this.getOptions('averageCenter');
	},

	/**
	 * Ŭ������ ��Ŀ�� ��ġ�� Ŭ�����͸� �����ϰ� �ִ� ��Ŀ�� ��� ��ǥ�� �� ������ ���θ� �����մϴ�.
	 * @param {boolean} averageCenter ��� ��ǥ�� Ŭ�����͸� ����
	 */
	setAverageCenter: function(averageCenter) {
		this.setOptions('averageCenter', averageCenter);
	},

	// KVO �̺�Ʈ �ڵ鷯
	changed: function(key, value) {
		if (!this.getMap()) return;

		switch (key) {
			case 'marker':
			case 'minClusterSize':
			case 'gridSize':
			case 'averageCenter':
				this._redraw();
				break;
			case 'indexGenerator':
			case 'icons':
				this._clusters.forEach(function(cluster) {
					cluster.updateIcon();
				});
				break;
			case 'maxZoom':
				this._clusters.forEach(function(cluster) {
					if (cluster.getCount() > 1) {
						cluster.checkByZoomAndMinClusterSize();
					}
				});
				break;
			case 'stylingFunction':
				this._clusters.forEach(function(cluster) {
					cluster.updateCount();
				});
				break;
			case 'disableClickZoom':
				var exec = 'enableClickZoom';

				if (value) {
					exec = 'disableClickZoom';
				}

				this._clusters.forEach(function(cluster) {
					cluster[exec]();
				});
				break;
		}
	},

	/**
	 * ���� ���� ��� ���� ���� ��Ŀ�� ���� Ŭ�����͸� �����մϴ�.
	 * @private
	 */
//	var innerCluster = [];
	_createClusters: function() {
		var map = this.getMap();

		if (!map) return;

		var bounds = map.getBounds(),
			markers = this.getMarkers();			
		for (var i = 0, ii = markers.length; i < ii; i++) {
			var marker = markers[i],
				position = marker.getPosition();

			if (!bounds.hasLatLng(position)) continue;
//			innerClust
			er.push(position);
			var	closestCluster = this._getClosestCluster(position);
			
			closestCluster.addMarker(marker);
			
			this._markerRelations.push(naver.maps.Event.addListener(marker, 'dragend', naver.maps.Util.bind(this._onDragEnd, this)));
		}
	},

	/**
	 * Ŭ�������� ������, �ؽ�Ʈ�� �����մϴ�.
	 * @private
	 */
	_updateClusters: function() {
		var clusters = this._clusters;

		for (var i = 0, ii = clusters.length; i < ii; i++) {
			clusters[i].updateCluster();
		}
	},

	/**
	 * Ŭ�����͸� ��� �����մϴ�.
	 * @private
	 */
	_clearClusters: function() {
		var clusters = this._clusters;

		for (var i = 0, ii = clusters.length; i < ii; i++) {
			clusters[i].destroy();
		}

		naver.maps.Event.removeListener(this._markerRelations);

		this._markerRelations = [];
		this._clusters = [];
	},

	/**
	 * ������ Ŭ�����͸� ��� �����ϰ�, �ٽ� �����մϴ�.
	 * @private
	 */
	_redraw: function() {
		this._clearClusters();
		this._createClusters();
		this._updateClusters();
	},

	/**
	 * ���޵� ��/�浵���� ���� ����� Ŭ�����͸� ��ȯ�մϴ�. ������ ���� Ŭ�����͸� ������ ��ȯ�մϴ�.
	 * @param {naver.maps.LatLng} position ��/�浵
	 * @return {Cluster} Ŭ������
	 */
	_getClosestCluster: function(position) {
		var proj = this.getProjection(),
			clusters = this._clusters,
			closestCluster = null,
			distance = Infinity;

		for (var i = 0, ii = clusters.length; i < ii; i++) {
			var cluster = clusters[i],
				center = cluster.getCenter();

			if (cluster.isInBounds(position)) {
				var delta = proj.getDistance(center, position);

				if (delta < distance) {
					distance = delta;
					closestCluster = cluster;
				}
			}
		}

		if (!closestCluster) {
			closestCluster = new Cluster(this);
			this._clusters.push(closestCluster);
		}

		return closestCluster;
	},

	/**
	 * ������ Idle ���� �̺�Ʈ �ڵ鷯�Դϴ�.
	 */
	_onIdle: function() {
		this._redraw();
	},

	/**
	 * �� ��Ŀ�� �巡�� ���� �̺�Ʈ �ڵ鷯�Դϴ�.
	 */
	_onDragEnd: function() {
		this._redraw();
	}
});

/**
 * ��Ŀ�� ������ �ִ� Ŭ�����͸� �����մϴ�.
 * @param {MarkerClustering} markerClusterer
 */
var Cluster = function(markerClusterer) {
	this._clusterCenter = null;
	this._clusterBounds = null;
	this._clusterMarker = null;
	this._relation = null;

	this._clusterMember = [];

	this._markerClusterer = markerClusterer;
};

Cluster.prototype = {
	constructor: Cluster,

	/**
	 * Ŭ�����Ϳ� ��Ŀ�� �߰��մϴ�.
	 * @param {naver.maps.Marker} marker Ŭ�����Ϳ� �߰��� ��Ŀ
	 */
	addMarker: function(marker) {
		if (this._isMember(marker)) return;

		if (!this._clusterCenter) {
			var position = marker.getPosition();

			this._clusterCenter = position;
			this._clusterBounds = this._calcBounds(position);
		}
		
		this._clusterMember.push(marker);
	},

	/**
	 * Ŭ�����͸� �����մϴ�.
	 */
	destroy: function() {
		naver.maps.Event.removeListener(this._relation);

		var members = this._clusterMember;

		for (var i = 0, ii = members.length; i < ii; i++) {
			members[i].setMap(null);
		}

		this._clusterMarker.setMap(null);

		this._clusterMarker = null;
		this._clusterCenter = null;
		this._clusterBounds = null;
		this._relation = null;

		this._clusterMember = [];
	},

	/**
	 * Ŭ������ �߽����� ��ȯ�մϴ�.
	 * @return {naver.maps.LatLng} Ŭ������ �߽���
	 */
	getCenter: function() {
		return this._clusterCenter;
	},

	/**
	 * Ŭ������ ��� ������ ��ȯ�մϴ�.
	 * @return {naver.maps.LatLngBounds} Ŭ������ ��� ����
	 */
	getBounds: function() {
		return this._clusterBounds;
	},

	/**
	 * Ŭ�����͸� �����ϴ� ��Ŀ ���� ��ȯ�մϴ�.
	 * @return {number} Ŭ�����͸� �����ϴ� ��Ŀ ��
	 */
	getCount: function() {
		return this._clusterMember.length;
  },
  
  /**
	 * ������ Ŭ������ ��� ��Ŀ ��ü�� ��ȯ�մϴ�.
	 * @return {naver.maps.Marker[]} Ŭ�����͸� �����ϴ� ��Ŀ ��ü ����
	 */
  getClusterMember: function() {
    return this._clusterMember;
  },

	/**
	 * ���޵� ��/�浵�� Ŭ������ ��� ���� ���� �ִ��� ���θ� ��ȯ�մϴ�.
	 * @param {naver.maps.LatLng} latlng ��/�浵
	 * @return {boolean} Ŭ������ ��� ���� ���� ��ġ ����
	 */
	isInBounds: function(latlng) {
		return this._clusterBounds && this._clusterBounds.hasLatLng(latlng);
  },

	/**
	 * Ŭ������ ��Ŀ Ŭ�� �� �� ������ �����ϵ��� �մϴ�.
	 */
	enableClickZoom: function() {
		if (this._relation) return;

		var map = this._markerClusterer.getMap();

		this._relation = naver.maps.Event.addListener(this._clusterMarker, 'click', naver.maps.Util.bind(function(e) {
			map.morph(e.coord, map.getZoom() + 1);
		}, this));
	},

	/**
	 * Ŭ������ ��Ŀ Ŭ�� �� �� ������ �������� �ʵ��� �մϴ�.
	 */
	disableClickZoom: function() {
		if (!this._relation) return;

		naver.maps.Event.removeListener(this._relation);
		this._relation = null;
	},

	/**
	 * Ŭ������ ��Ŀ�� ������ Ŭ������ ��Ŀ�� �����ϰ�, Ŭ������ ��Ŀ�� �����մϴ�.
	 * - Ŭ������ ��Ŀ ������
	 * - ��Ŀ ����
	 * - Ŭ������ ��Ŀ ���� ����
	 */
	updateCluster: function() {
		if (!this._clusterMarker) {
			var position;

			if (this._markerClusterer.getAverageCenter()) {
				position = this._calcAverageCenter(this._clusterMember);
			} else {
				position = this._clusterCenter;
			}

			this._clusterMarker = new naver.maps.Marker({
				position: position,
				map: this._markerClusterer.getMap()
			});

			if (!this._markerClusterer.getDisableClickZoom()) {
				this.enableClickZoom();
			}
		}

		this.updateIcon();
		this.updateCount();

		this.checkByZoomAndMinClusterSize();
	},

	/**
	 * ���ǿ� ���� Ŭ������ ��Ŀ�� �����ϰų�, �������� �ʽ��ϴ�.
	 */
	checkByZoomAndMinClusterSize: function() {
		var clusterer = this._markerClusterer,
			minClusterSize = clusterer.getMinClusterSize(),
			maxZoom = clusterer.getMaxZoom(),
			currentZoom = clusterer.getMap().getZoom();

		if (this.getCount() < minClusterSize) {
			this._showMember();
		} else {
			this._hideMember();

			if (maxZoom <= currentZoom) {
				this._showMember();
			}
		}
	},

	/**
	 * Ŭ�����͸� �����ϴ� ��Ŀ ���� �����մϴ�.
	 */
	updateCount: function() {
		var stylingFunction = this._markerClusterer.getStylingFunction();

		stylingFunction && stylingFunction(this._clusterMarker, this.getCount());
	},

	/**
	 * Ŭ������ ��Ŀ �������� �����մϴ�.
	 */
	updateIcon: function() {
		var count = this.getCount(),
			index = this._getIndex(count),
			icons = this._markerClusterer.getIcons();

		index = Math.max(index, 0);
		index = Math.min(index, icons.length - 1);

		this._clusterMarker.setIcon(icons[index]);
	},

	/**
	 * Ŭ�����͸� �����ϴ� ��Ŀ�� �����մϴ�. �̶����� Ŭ������ ��Ŀ�� �������� �ʽ��ϴ�.
	 * @private
	 */
	_showMember: function() {
		var map = this._markerClusterer.getMap(),
			marker = this._clusterMarker,
			members = this._clusterMember;

		for (var i = 0, ii = members.length; i < ii; i++) {
			members[i].setMap(map);
		}

		if (marker) {
			marker.setMap(null);
		}
	},

	/**
	 * Ŭ�����͸� �����ϴ� ��Ŀ�� �������� �ʽ��ϴ�. �̶����� Ŭ������ ��Ŀ�� �����մϴ�.
	 * @private
	 */
	_hideMember: function() {
		var map = this._markerClusterer.getMap(),
			marker = this._clusterMarker,
			members = this._clusterMember;

		for (var i = 0, ii = members.length; i < ii; i++) {
			members[i].setMap(null);
		}

		if (marker && !marker.getMap()) {
			marker.setMap(map);
		}
	},

	/**
	 * ���޵� ��/�浵�� �߽����� �׸��� ũ�⸸ŭ Ȯ���� Ŭ������ ��� ������ ��ȯ�մϴ�.
	 * @param {naver.maps.LatLng} position ��/�浵
	 * @return {naver.maps.LatLngBounds} Ŭ������ ��� ����
	 * @private
	 */
	_calcBounds: function(position) {
		var map = this._markerClusterer.getMap(),
			bounds = new naver.maps.LatLngBounds(position.clone(), position.clone()),
			mapBounds = map.getBounds(),
			proj = map.getProjection(),
			map_max_px = proj.fromCoordToOffset(mapBounds.getNE()),
			map_min_px = proj.fromCoordToOffset(mapBounds.getSW()),
			max_px = proj.fromCoordToOffset(bounds.getNE()),
			min_px = proj.fromCoordToOffset(bounds.getSW()),
			gridSize = this._markerClusterer.getGridSize() / 2;

		max_px.add(gridSize, -gridSize);
		min_px.add(-gridSize, gridSize);

		var max_px_x = Math.min(map_max_px.x, max_px.x),
			max_px_y = Math.max(map_max_px.y, max_px.y),
			min_px_x = Math.max(map_min_px.x, min_px.x),
			min_px_y = Math.min(map_min_px.y, min_px.y),
			newMax = proj.fromOffsetToCoord(new naver.maps.Point(max_px_x, max_px_y)),
			newMin = proj.fromOffsetToCoord(new naver.maps.Point(min_px_x, min_px_y));

		return new naver.maps.LatLngBounds(newMin, newMax);
	},

	/**
	 * Ŭ�����͸� �����ϴ� ��Ŀ ���� ���� ������ �������� �����ϱ� ���� �ε����� ��ȯ�մϴ�.
	 * @param {number} count Ŭ�����͸� �����ϴ� ��Ŀ ��
	 * @return {number} �ε���
	 * @private
	 */
	_getIndex: function(count) {
		var indexGenerator = this._markerClusterer.getIndexGenerator();

		if (naver.maps.Util.isFunction(indexGenerator)) {
			return indexGenerator(count);
		} else if (naver.maps.Util.isArray(indexGenerator)) {
			var index = 0;

			for (var i = index, ii = indexGenerator.length; i < ii; i++) {
				var factor = indexGenerator[i];

				if (count < factor) break;

				index++;
			}

			return index;
		}
	},

	/**
	 * ���޵� ��Ŀ�� �̹� Ŭ�����Ϳ� ���� �ִ��� ���θ� ��ȯ�մϴ�.
	 * @param {naver.maps.Marker} marker ��Ŀ
	 * @return {boolean} Ŭ�����Ϳ� ���� �ִ��� ����
	 * @private
	 */
	_isMember: function(marker) {
		return this._clusterMember.indexOf(marker) !== -1;
	},

	/**
	 * ���޵� ��Ŀ���� �߽� ��ǥ�� ��ȯ�մϴ�.
	 * @param {Array.<naver.maps.Marker>} markers ��Ŀ �迭
	 * @return {naver.maps.Point} ��Ŀ���� �߽� ��ǥ
	 * @private
	 */
	_calcAverageCenter: function(markers) {
		var numberOfMarkers = markers.length;
		var averageCenter = [0, 0];
		
		for (var i = 0; i < numberOfMarkers; i++) {
			averageCenter[0] += markers[i].position.x;
			averageCenter[1] += markers[i].position.y;
		}

		averageCenter[0] /= numberOfMarkers;
		averageCenter[1] /= numberOfMarkers;

		return new naver.maps.Point(averageCenter[0], averageCenter[1]);
	}


};