// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library viewport_observer_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojom/sky/input_event.mojom.dart' as input_event_mojom;


class ViewportObserverOnViewportMetricsChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int width = 0;
  int height = 0;
  double devicePixelRatio = 0.0;

  ViewportObserverOnViewportMetricsChangedParams() : super(kVersions.last.size);

  static ViewportObserverOnViewportMetricsChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static ViewportObserverOnViewportMetricsChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverOnViewportMetricsChangedParams result = new ViewportObserverOnViewportMetricsChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.width = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.height = decoder0.decodeInt32(12);
    }
    if (mainDataHeader.version >= 0) {
      
      result.devicePixelRatio = decoder0.decodeFloat(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(width, 8);
    
    encoder0.encodeInt32(height, 12);
    
    encoder0.encodeFloat(devicePixelRatio, 16);
  }

  String toString() {
    return "ViewportObserverOnViewportMetricsChangedParams("
           "width: $width" ", "
           "height: $height" ", "
           "devicePixelRatio: $devicePixelRatio" ")";
  }
}

class ViewportObserverOnInputEventParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  input_event_mojom.InputEvent event = null;

  ViewportObserverOnInputEventParams() : super(kVersions.last.size);

  static ViewportObserverOnInputEventParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static ViewportObserverOnInputEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverOnInputEventParams result = new ViewportObserverOnInputEventParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.event = input_event_mojom.InputEvent.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(event, 8, false);
  }

  String toString() {
    return "ViewportObserverOnInputEventParams("
           "event: $event" ")";
  }
}

class ViewportObserverRunFromNetworkParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  ViewportObserverRunFromNetworkParams() : super(kVersions.last.size);

  static ViewportObserverRunFromNetworkParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static ViewportObserverRunFromNetworkParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverRunFromNetworkParams result = new ViewportObserverRunFromNetworkParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(url, 8, false);
  }

  String toString() {
    return "ViewportObserverRunFromNetworkParams("
           "url: $url" ")";
  }
}

class ViewportObserverRunFromFileParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String main = null;
  String packageRoot = null;

  ViewportObserverRunFromFileParams() : super(kVersions.last.size);

  static ViewportObserverRunFromFileParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static ViewportObserverRunFromFileParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverRunFromFileParams result = new ViewportObserverRunFromFileParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.main = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.packageRoot = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(main, 8, false);
    
    encoder0.encodeString(packageRoot, 16, false);
  }

  String toString() {
    return "ViewportObserverRunFromFileParams("
           "main: $main" ", "
           "packageRoot: $packageRoot" ")";
  }
}

class ViewportObserverRunFromSnapshotParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String path = null;

  ViewportObserverRunFromSnapshotParams() : super(kVersions.last.size);

  static ViewportObserverRunFromSnapshotParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static ViewportObserverRunFromSnapshotParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverRunFromSnapshotParams result = new ViewportObserverRunFromSnapshotParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.path = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(path, 8, false);
  }

  String toString() {
    return "ViewportObserverRunFromSnapshotParams("
           "path: $path" ")";
  }
}

const int kViewportObserver_onViewportMetricsChanged_name = 0;
const int kViewportObserver_onInputEvent_name = 1;
const int kViewportObserver_runFromNetwork_name = 2;
const int kViewportObserver_runFromFile_name = 3;
const int kViewportObserver_runFromSnapshot_name = 4;

const String ViewportObserverName =
      'sky::ViewportObserver';

abstract class ViewportObserver {
  void onViewportMetricsChanged(int width, int height, double devicePixelRatio);
  void onInputEvent(input_event_mojom.InputEvent event);
  void runFromNetwork(String url);
  void runFromFile(String main, String packageRoot);
  void runFromSnapshot(String path);

}


class ViewportObserverProxyImpl extends bindings.Proxy {
  ViewportObserverProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ViewportObserverProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewportObserverProxyImpl.unbound() : super.unbound();

  static ViewportObserverProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewportObserverProxyImpl"));
    return new ViewportObserverProxyImpl.fromEndpoint(endpoint);
  }

  String get name => ViewportObserverName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ViewportObserverProxyImpl($superString)";
  }
}


class _ViewportObserverProxyCalls implements ViewportObserver {
  ViewportObserverProxyImpl _proxyImpl;

  _ViewportObserverProxyCalls(this._proxyImpl);
    void onViewportMetricsChanged(int width, int height, double devicePixelRatio) {
      assert(_proxyImpl.isBound);
      var params = new ViewportObserverOnViewportMetricsChangedParams();
      params.width = width;
      params.height = height;
      params.devicePixelRatio = devicePixelRatio;
      _proxyImpl.sendMessage(params, kViewportObserver_onViewportMetricsChanged_name);
    }
  
    void onInputEvent(input_event_mojom.InputEvent event) {
      assert(_proxyImpl.isBound);
      var params = new ViewportObserverOnInputEventParams();
      params.event = event;
      _proxyImpl.sendMessage(params, kViewportObserver_onInputEvent_name);
    }
  
    void runFromNetwork(String url) {
      assert(_proxyImpl.isBound);
      var params = new ViewportObserverRunFromNetworkParams();
      params.url = url;
      _proxyImpl.sendMessage(params, kViewportObserver_runFromNetwork_name);
    }
  
    void runFromFile(String main, String packageRoot) {
      assert(_proxyImpl.isBound);
      var params = new ViewportObserverRunFromFileParams();
      params.main = main;
      params.packageRoot = packageRoot;
      _proxyImpl.sendMessage(params, kViewportObserver_runFromFile_name);
    }
  
    void runFromSnapshot(String path) {
      assert(_proxyImpl.isBound);
      var params = new ViewportObserverRunFromSnapshotParams();
      params.path = path;
      _proxyImpl.sendMessage(params, kViewportObserver_runFromSnapshot_name);
    }
  
}


class ViewportObserverProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ViewportObserver ptr;
  final String name = ViewportObserverName;

  ViewportObserverProxy(ViewportObserverProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ViewportObserverProxyCalls(proxyImpl);

  ViewportObserverProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ViewportObserverProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ViewportObserverProxyCalls(impl);
  }

  ViewportObserverProxy.fromHandle(core.MojoHandle handle) :
      impl = new ViewportObserverProxyImpl.fromHandle(handle) {
    ptr = new _ViewportObserverProxyCalls(impl);
  }

  ViewportObserverProxy.unbound() :
      impl = new ViewportObserverProxyImpl.unbound() {
    ptr = new _ViewportObserverProxyCalls(impl);
  }

  static ViewportObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewportObserverProxy"));
    return new ViewportObserverProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "ViewportObserverProxy($impl)";
  }
}


class ViewportObserverStub extends bindings.Stub {
  ViewportObserver _impl = null;

  ViewportObserverStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ViewportObserverStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ViewportObserverStub.unbound() : super.unbound();

  static ViewportObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewportObserverStub"));
    return new ViewportObserverStub.fromEndpoint(endpoint);
  }

  static const String name = ViewportObserverName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kViewportObserver_onViewportMetricsChanged_name:
        var params = ViewportObserverOnViewportMetricsChangedParams.deserialize(
            message.payload);
        _impl.onViewportMetricsChanged(params.width, params.height, params.devicePixelRatio);
        break;
      case kViewportObserver_onInputEvent_name:
        var params = ViewportObserverOnInputEventParams.deserialize(
            message.payload);
        _impl.onInputEvent(params.event);
        break;
      case kViewportObserver_runFromNetwork_name:
        var params = ViewportObserverRunFromNetworkParams.deserialize(
            message.payload);
        _impl.runFromNetwork(params.url);
        break;
      case kViewportObserver_runFromFile_name:
        var params = ViewportObserverRunFromFileParams.deserialize(
            message.payload);
        _impl.runFromFile(params.main, params.packageRoot);
        break;
      case kViewportObserver_runFromSnapshot_name:
        var params = ViewportObserverRunFromSnapshotParams.deserialize(
            message.payload);
        _impl.runFromSnapshot(params.path);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewportObserver get impl => _impl;
  set impl(ViewportObserver d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ViewportObserverStub($superString)";
  }

  int get version => 0;
}


