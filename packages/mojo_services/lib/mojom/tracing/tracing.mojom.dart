// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tracing_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;


class TraceControllerStartTracingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String categories = null;
  Object collector = null;

  TraceControllerStartTracingParams() : super(kVersions.last.size);

  static TraceControllerStartTracingParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TraceControllerStartTracingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceControllerStartTracingParams result = new TraceControllerStartTracingParams();

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
      
      result.categories = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.collector = decoder0.decodeServiceInterface(16, false, TraceDataCollectorProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(categories, 8, false);
    
    encoder0.encodeInterface(collector, 16, false);
  }

  String toString() {
    return "TraceControllerStartTracingParams("
           "categories: $categories" ", "
           "collector: $collector" ")";
  }
}

class TraceControllerStopTracingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TraceControllerStopTracingParams() : super(kVersions.last.size);

  static TraceControllerStopTracingParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TraceControllerStopTracingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceControllerStopTracingParams result = new TraceControllerStopTracingParams();

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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "TraceControllerStopTracingParams("")";
  }
}

class TraceDataCollectorDataCollectedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String json = null;

  TraceDataCollectorDataCollectedParams() : super(kVersions.last.size);

  static TraceDataCollectorDataCollectedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TraceDataCollectorDataCollectedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceDataCollectorDataCollectedParams result = new TraceDataCollectorDataCollectedParams();

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
      
      result.json = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(json, 8, false);
  }

  String toString() {
    return "TraceDataCollectorDataCollectedParams("
           "json: $json" ")";
  }
}

class TraceCoordinatorStartParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  core.MojoDataPipeProducer stream = null;
  String categories = null;

  TraceCoordinatorStartParams() : super(kVersions.last.size);

  static TraceCoordinatorStartParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TraceCoordinatorStartParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceCoordinatorStartParams result = new TraceCoordinatorStartParams();

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
      
      result.stream = decoder0.decodeProducerHandle(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.categories = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeProducerHandle(stream, 8, false);
    
    encoder0.encodeString(categories, 16, false);
  }

  String toString() {
    return "TraceCoordinatorStartParams("
           "stream: $stream" ", "
           "categories: $categories" ")";
  }
}

class TraceCoordinatorStopAndFlushParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TraceCoordinatorStopAndFlushParams() : super(kVersions.last.size);

  static TraceCoordinatorStopAndFlushParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TraceCoordinatorStopAndFlushParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TraceCoordinatorStopAndFlushParams result = new TraceCoordinatorStopAndFlushParams();

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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "TraceCoordinatorStopAndFlushParams("")";
  }
}

const int kTraceController_startTracing_name = 0;
const int kTraceController_stopTracing_name = 1;

const String TraceControllerName =
      'tracing::TraceController';

abstract class TraceController {
  void startTracing(String categories, Object collector);
  void stopTracing();

}


class TraceControllerProxyImpl extends bindings.Proxy {
  TraceControllerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TraceControllerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceControllerProxyImpl.unbound() : super.unbound();

  static TraceControllerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceControllerProxyImpl"));
    return new TraceControllerProxyImpl.fromEndpoint(endpoint);
  }

  String get name => TraceControllerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TraceControllerProxyImpl($superString)";
  }
}


class _TraceControllerProxyCalls implements TraceController {
  TraceControllerProxyImpl _proxyImpl;

  _TraceControllerProxyCalls(this._proxyImpl);
    void startTracing(String categories, Object collector) {
      assert(_proxyImpl.isBound);
      var params = new TraceControllerStartTracingParams();
      params.categories = categories;
      params.collector = collector;
      _proxyImpl.sendMessage(params, kTraceController_startTracing_name);
    }
  
    void stopTracing() {
      assert(_proxyImpl.isBound);
      var params = new TraceControllerStopTracingParams();
      _proxyImpl.sendMessage(params, kTraceController_stopTracing_name);
    }
  
}


class TraceControllerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TraceController ptr;
  final String name = TraceControllerName;

  TraceControllerProxy(TraceControllerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TraceControllerProxyCalls(proxyImpl);

  TraceControllerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TraceControllerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TraceControllerProxyCalls(impl);
  }

  TraceControllerProxy.fromHandle(core.MojoHandle handle) :
      impl = new TraceControllerProxyImpl.fromHandle(handle) {
    ptr = new _TraceControllerProxyCalls(impl);
  }

  TraceControllerProxy.unbound() :
      impl = new TraceControllerProxyImpl.unbound() {
    ptr = new _TraceControllerProxyCalls(impl);
  }

  static TraceControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceControllerProxy"));
    return new TraceControllerProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "TraceControllerProxy($impl)";
  }
}


class TraceControllerStub extends bindings.Stub {
  TraceController _impl = null;

  TraceControllerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TraceControllerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TraceControllerStub.unbound() : super.unbound();

  static TraceControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceControllerStub"));
    return new TraceControllerStub.fromEndpoint(endpoint);
  }

  static const String name = TraceControllerName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kTraceController_startTracing_name:
        var params = TraceControllerStartTracingParams.deserialize(
            message.payload);
        _impl.startTracing(params.categories, params.collector);
        break;
      case kTraceController_stopTracing_name:
        var params = TraceControllerStopTracingParams.deserialize(
            message.payload);
        _impl.stopTracing();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceController get impl => _impl;
  set impl(TraceController d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TraceControllerStub($superString)";
  }

  int get version => 0;
}

const int kTraceDataCollector_dataCollected_name = 0;

const String TraceDataCollectorName =
      'tracing::TraceDataCollector';

abstract class TraceDataCollector {
  void dataCollected(String json);

}


class TraceDataCollectorProxyImpl extends bindings.Proxy {
  TraceDataCollectorProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TraceDataCollectorProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceDataCollectorProxyImpl.unbound() : super.unbound();

  static TraceDataCollectorProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceDataCollectorProxyImpl"));
    return new TraceDataCollectorProxyImpl.fromEndpoint(endpoint);
  }

  String get name => TraceDataCollectorName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TraceDataCollectorProxyImpl($superString)";
  }
}


class _TraceDataCollectorProxyCalls implements TraceDataCollector {
  TraceDataCollectorProxyImpl _proxyImpl;

  _TraceDataCollectorProxyCalls(this._proxyImpl);
    void dataCollected(String json) {
      assert(_proxyImpl.isBound);
      var params = new TraceDataCollectorDataCollectedParams();
      params.json = json;
      _proxyImpl.sendMessage(params, kTraceDataCollector_dataCollected_name);
    }
  
}


class TraceDataCollectorProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TraceDataCollector ptr;
  final String name = TraceDataCollectorName;

  TraceDataCollectorProxy(TraceDataCollectorProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TraceDataCollectorProxyCalls(proxyImpl);

  TraceDataCollectorProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TraceDataCollectorProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TraceDataCollectorProxyCalls(impl);
  }

  TraceDataCollectorProxy.fromHandle(core.MojoHandle handle) :
      impl = new TraceDataCollectorProxyImpl.fromHandle(handle) {
    ptr = new _TraceDataCollectorProxyCalls(impl);
  }

  TraceDataCollectorProxy.unbound() :
      impl = new TraceDataCollectorProxyImpl.unbound() {
    ptr = new _TraceDataCollectorProxyCalls(impl);
  }

  static TraceDataCollectorProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceDataCollectorProxy"));
    return new TraceDataCollectorProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "TraceDataCollectorProxy($impl)";
  }
}


class TraceDataCollectorStub extends bindings.Stub {
  TraceDataCollector _impl = null;

  TraceDataCollectorStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TraceDataCollectorStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TraceDataCollectorStub.unbound() : super.unbound();

  static TraceDataCollectorStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceDataCollectorStub"));
    return new TraceDataCollectorStub.fromEndpoint(endpoint);
  }

  static const String name = TraceDataCollectorName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kTraceDataCollector_dataCollected_name:
        var params = TraceDataCollectorDataCollectedParams.deserialize(
            message.payload);
        _impl.dataCollected(params.json);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceDataCollector get impl => _impl;
  set impl(TraceDataCollector d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TraceDataCollectorStub($superString)";
  }

  int get version => 0;
}

const int kTraceCoordinator_start_name = 0;
const int kTraceCoordinator_stopAndFlush_name = 1;

const String TraceCoordinatorName =
      'tracing::TraceCoordinator';

abstract class TraceCoordinator {
  void start(core.MojoDataPipeProducer stream, String categories);
  void stopAndFlush();

}


class TraceCoordinatorProxyImpl extends bindings.Proxy {
  TraceCoordinatorProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TraceCoordinatorProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TraceCoordinatorProxyImpl.unbound() : super.unbound();

  static TraceCoordinatorProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceCoordinatorProxyImpl"));
    return new TraceCoordinatorProxyImpl.fromEndpoint(endpoint);
  }

  String get name => TraceCoordinatorName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TraceCoordinatorProxyImpl($superString)";
  }
}


class _TraceCoordinatorProxyCalls implements TraceCoordinator {
  TraceCoordinatorProxyImpl _proxyImpl;

  _TraceCoordinatorProxyCalls(this._proxyImpl);
    void start(core.MojoDataPipeProducer stream, String categories) {
      assert(_proxyImpl.isBound);
      var params = new TraceCoordinatorStartParams();
      params.stream = stream;
      params.categories = categories;
      _proxyImpl.sendMessage(params, kTraceCoordinator_start_name);
    }
  
    void stopAndFlush() {
      assert(_proxyImpl.isBound);
      var params = new TraceCoordinatorStopAndFlushParams();
      _proxyImpl.sendMessage(params, kTraceCoordinator_stopAndFlush_name);
    }
  
}


class TraceCoordinatorProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TraceCoordinator ptr;
  final String name = TraceCoordinatorName;

  TraceCoordinatorProxy(TraceCoordinatorProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TraceCoordinatorProxyCalls(proxyImpl);

  TraceCoordinatorProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TraceCoordinatorProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TraceCoordinatorProxyCalls(impl);
  }

  TraceCoordinatorProxy.fromHandle(core.MojoHandle handle) :
      impl = new TraceCoordinatorProxyImpl.fromHandle(handle) {
    ptr = new _TraceCoordinatorProxyCalls(impl);
  }

  TraceCoordinatorProxy.unbound() :
      impl = new TraceCoordinatorProxyImpl.unbound() {
    ptr = new _TraceCoordinatorProxyCalls(impl);
  }

  static TraceCoordinatorProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceCoordinatorProxy"));
    return new TraceCoordinatorProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "TraceCoordinatorProxy($impl)";
  }
}


class TraceCoordinatorStub extends bindings.Stub {
  TraceCoordinator _impl = null;

  TraceCoordinatorStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TraceCoordinatorStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TraceCoordinatorStub.unbound() : super.unbound();

  static TraceCoordinatorStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceCoordinatorStub"));
    return new TraceCoordinatorStub.fromEndpoint(endpoint);
  }

  static const String name = TraceCoordinatorName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kTraceCoordinator_start_name:
        var params = TraceCoordinatorStartParams.deserialize(
            message.payload);
        _impl.start(params.stream, params.categories);
        break;
      case kTraceCoordinator_stopAndFlush_name:
        var params = TraceCoordinatorStopAndFlushParams.deserialize(
            message.payload);
        _impl.stopAndFlush();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TraceCoordinator get impl => _impl;
  set impl(TraceCoordinator d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TraceCoordinatorStub($superString)";
  }

  int get version => 0;
}


