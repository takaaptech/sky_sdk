// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sensors_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;

const int SensorType_ACCELEROMETER = 0;
const int SensorType_AMBIENT_TEMPERATURE = 1;
const int SensorType_GAME_ROTATION_VECTOR = 2;
const int SensorType_GEOMAGNETIC_ROTATION_VECTOR = 3;
const int SensorType_GRAVITY = 4;
const int SensorType_GYROSCOPE = 5;
const int SensorType_GYROSCOPE_UNCALIBRATED = 6;
const int SensorType_HEART_RATE = 7;
const int SensorType_LIGHT = 8;
const int SensorType_LINEAR_ACCELERATION = 9;
const int SensorType_MAGNETIC_FIELD = 10;
const int SensorType_MAGNETIC_FIELD_UNCALIBRATED = 11;
const int SensorType_PRESSURE = 12;
const int SensorType_PROXIMITY = 13;
const int SensorType_RELATIVE_HUMIDITY = 14;
const int SensorType_ROTATION_VECTOR = 15;
const int SensorType_SIGNIFICANT_MOTION = 16;
const int SensorType_STEP_COUNTER = 17;
const int SensorType_STEP_DETECTOR = 18;


class SensorData extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int accuracy = 0;
  int timeStamp = 0;
  List<double> values = null;

  SensorData() : super(kVersions.last.size);

  static SensorData deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SensorData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SensorData result = new SensorData();

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
      
      result.accuracy = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.timeStamp = decoder0.decodeInt64(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.values = decoder0.decodeFloatArray(24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(accuracy, 8);
    
    encoder0.encodeInt64(timeStamp, 16);
    
    encoder0.encodeFloatArray(values, 24, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "SensorData("
           "accuracy: $accuracy" ", "
           "timeStamp: $timeStamp" ", "
           "values: $values" ")";
  }
}

class SensorListenerOnAccuracyChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int accuracy = 0;

  SensorListenerOnAccuracyChangedParams() : super(kVersions.last.size);

  static SensorListenerOnAccuracyChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SensorListenerOnAccuracyChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SensorListenerOnAccuracyChangedParams result = new SensorListenerOnAccuracyChangedParams();

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
      
      result.accuracy = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(accuracy, 8);
  }

  String toString() {
    return "SensorListenerOnAccuracyChangedParams("
           "accuracy: $accuracy" ")";
  }
}

class SensorListenerOnSensorChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  SensorData data = null;

  SensorListenerOnSensorChangedParams() : super(kVersions.last.size);

  static SensorListenerOnSensorChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SensorListenerOnSensorChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SensorListenerOnSensorChangedParams result = new SensorListenerOnSensorChangedParams();

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
      result.data = SensorData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(data, 8, false);
  }

  String toString() {
    return "SensorListenerOnSensorChangedParams("
           "data: $data" ")";
  }
}

class SensorServiceAddListenerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int type = 0;
  Object listener = null;

  SensorServiceAddListenerParams() : super(kVersions.last.size);

  static SensorServiceAddListenerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static SensorServiceAddListenerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SensorServiceAddListenerParams result = new SensorServiceAddListenerParams();

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
      
      result.type = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.listener = decoder0.decodeServiceInterface(12, false, SensorListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(type, 8);
    
    encoder0.encodeInterface(listener, 12, false);
  }

  String toString() {
    return "SensorServiceAddListenerParams("
           "type: $type" ", "
           "listener: $listener" ")";
  }
}

const int kSensorListener_onAccuracyChanged_name = 0;
const int kSensorListener_onSensorChanged_name = 1;

const String SensorListenerName =
      'sensors::SensorListener';

abstract class SensorListener {
  void onAccuracyChanged(int accuracy);
  void onSensorChanged(SensorData data);

}


class SensorListenerProxyImpl extends bindings.Proxy {
  SensorListenerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  SensorListenerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  SensorListenerProxyImpl.unbound() : super.unbound();

  static SensorListenerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorListenerProxyImpl"));
    return new SensorListenerProxyImpl.fromEndpoint(endpoint);
  }

  String get name => SensorListenerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "SensorListenerProxyImpl($superString)";
  }
}


class _SensorListenerProxyCalls implements SensorListener {
  SensorListenerProxyImpl _proxyImpl;

  _SensorListenerProxyCalls(this._proxyImpl);
    void onAccuracyChanged(int accuracy) {
      assert(_proxyImpl.isBound);
      var params = new SensorListenerOnAccuracyChangedParams();
      params.accuracy = accuracy;
      _proxyImpl.sendMessage(params, kSensorListener_onAccuracyChanged_name);
    }
  
    void onSensorChanged(SensorData data) {
      assert(_proxyImpl.isBound);
      var params = new SensorListenerOnSensorChangedParams();
      params.data = data;
      _proxyImpl.sendMessage(params, kSensorListener_onSensorChanged_name);
    }
  
}


class SensorListenerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  SensorListener ptr;
  final String name = SensorListenerName;

  SensorListenerProxy(SensorListenerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _SensorListenerProxyCalls(proxyImpl);

  SensorListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new SensorListenerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _SensorListenerProxyCalls(impl);
  }

  SensorListenerProxy.fromHandle(core.MojoHandle handle) :
      impl = new SensorListenerProxyImpl.fromHandle(handle) {
    ptr = new _SensorListenerProxyCalls(impl);
  }

  SensorListenerProxy.unbound() :
      impl = new SensorListenerProxyImpl.unbound() {
    ptr = new _SensorListenerProxyCalls(impl);
  }

  static SensorListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorListenerProxy"));
    return new SensorListenerProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "SensorListenerProxy($impl)";
  }
}


class SensorListenerStub extends bindings.Stub {
  SensorListener _impl = null;

  SensorListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  SensorListenerStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  SensorListenerStub.unbound() : super.unbound();

  static SensorListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorListenerStub"));
    return new SensorListenerStub.fromEndpoint(endpoint);
  }

  static const String name = SensorListenerName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kSensorListener_onAccuracyChanged_name:
        var params = SensorListenerOnAccuracyChangedParams.deserialize(
            message.payload);
        _impl.onAccuracyChanged(params.accuracy);
        break;
      case kSensorListener_onSensorChanged_name:
        var params = SensorListenerOnSensorChangedParams.deserialize(
            message.payload);
        _impl.onSensorChanged(params.data);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  SensorListener get impl => _impl;
  set impl(SensorListener d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "SensorListenerStub($superString)";
  }

  int get version => 0;
}

const int kSensorService_addListener_name = 0;

const String SensorServiceName =
      'sensors::SensorService';

abstract class SensorService {
  void addListener(int type, Object listener);

}


class SensorServiceProxyImpl extends bindings.Proxy {
  SensorServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  SensorServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  SensorServiceProxyImpl.unbound() : super.unbound();

  static SensorServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorServiceProxyImpl"));
    return new SensorServiceProxyImpl.fromEndpoint(endpoint);
  }

  String get name => SensorServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "SensorServiceProxyImpl($superString)";
  }
}


class _SensorServiceProxyCalls implements SensorService {
  SensorServiceProxyImpl _proxyImpl;

  _SensorServiceProxyCalls(this._proxyImpl);
    void addListener(int type, Object listener) {
      assert(_proxyImpl.isBound);
      var params = new SensorServiceAddListenerParams();
      params.type = type;
      params.listener = listener;
      _proxyImpl.sendMessage(params, kSensorService_addListener_name);
    }
  
}


class SensorServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  SensorService ptr;
  final String name = SensorServiceName;

  SensorServiceProxy(SensorServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _SensorServiceProxyCalls(proxyImpl);

  SensorServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new SensorServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _SensorServiceProxyCalls(impl);
  }

  SensorServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new SensorServiceProxyImpl.fromHandle(handle) {
    ptr = new _SensorServiceProxyCalls(impl);
  }

  SensorServiceProxy.unbound() :
      impl = new SensorServiceProxyImpl.unbound() {
    ptr = new _SensorServiceProxyCalls(impl);
  }

  static SensorServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorServiceProxy"));
    return new SensorServiceProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "SensorServiceProxy($impl)";
  }
}


class SensorServiceStub extends bindings.Stub {
  SensorService _impl = null;

  SensorServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  SensorServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  SensorServiceStub.unbound() : super.unbound();

  static SensorServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For SensorServiceStub"));
    return new SensorServiceStub.fromEndpoint(endpoint);
  }

  static const String name = SensorServiceName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kSensorService_addListener_name:
        var params = SensorServiceAddListenerParams.deserialize(
            message.payload);
        _impl.addListener(params.type, params.listener);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  SensorService get impl => _impl;
  set impl(SensorService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "SensorServiceStub($superString)";
  }

  int get version => 0;
}


