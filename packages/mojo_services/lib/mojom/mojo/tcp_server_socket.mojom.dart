// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library tcp_server_socket_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojom/mojo/network_error.mojom.dart' as network_error_mojom;
import 'package:mojom/mojo/net_address.mojom.dart' as net_address_mojom;
import 'package:mojom/mojo/tcp_connected_socket.mojom.dart' as tcp_connected_socket_mojom;


class TcpServerSocketAcceptParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  core.MojoDataPipeConsumer sendStream = null;
  core.MojoDataPipeProducer receiveStream = null;
  Object clientSocket = null;

  TcpServerSocketAcceptParams() : super(kVersions.last.size);

  static TcpServerSocketAcceptParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TcpServerSocketAcceptParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptParams result = new TcpServerSocketAcceptParams();

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
      
      result.sendStream = decoder0.decodeConsumerHandle(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.receiveStream = decoder0.decodeProducerHandle(12, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.clientSocket = decoder0.decodeInterfaceRequest(16, false, tcp_connected_socket_mojom.TcpConnectedSocketStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeConsumerHandle(sendStream, 8, false);
    
    encoder0.encodeProducerHandle(receiveStream, 12, false);
    
    encoder0.encodeInterfaceRequest(clientSocket, 16, false);
  }

  String toString() {
    return "TcpServerSocketAcceptParams("
           "sendStream: $sendStream" ", "
           "receiveStream: $receiveStream" ", "
           "clientSocket: $clientSocket" ")";
  }
}

class TcpServerSocketAcceptResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  network_error_mojom.NetworkError result = null;
  net_address_mojom.NetAddress remoteAddress = null;

  TcpServerSocketAcceptResponseParams() : super(kVersions.last.size);

  static TcpServerSocketAcceptResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static TcpServerSocketAcceptResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TcpServerSocketAcceptResponseParams result = new TcpServerSocketAcceptResponseParams();

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
      result.result = network_error_mojom.NetworkError.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.remoteAddress = net_address_mojom.NetAddress.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(result, 8, false);
    
    encoder0.encodeStruct(remoteAddress, 16, true);
  }

  String toString() {
    return "TcpServerSocketAcceptResponseParams("
           "result: $result" ", "
           "remoteAddress: $remoteAddress" ")";
  }
}

const int kTcpServerSocket_accept_name = 0;

const String TcpServerSocketName =
      'mojo::TCPServerSocket';

abstract class TcpServerSocket {
  Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]);

}


class TcpServerSocketProxyImpl extends bindings.Proxy {
  TcpServerSocketProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TcpServerSocketProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TcpServerSocketProxyImpl.unbound() : super.unbound();

  static TcpServerSocketProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpServerSocketProxyImpl"));
    return new TcpServerSocketProxyImpl.fromEndpoint(endpoint);
  }

  String get name => TcpServerSocketName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var r = TcpServerSocketAcceptResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TcpServerSocketProxyImpl($superString)";
  }
}


class _TcpServerSocketProxyCalls implements TcpServerSocket {
  TcpServerSocketProxyImpl _proxyImpl;

  _TcpServerSocketProxyCalls(this._proxyImpl);
    Future<TcpServerSocketAcceptResponseParams> accept(core.MojoDataPipeConsumer sendStream,core.MojoDataPipeProducer receiveStream,Object clientSocket,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TcpServerSocketAcceptParams();
      params.sendStream = sendStream;
      params.receiveStream = receiveStream;
      params.clientSocket = clientSocket;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTcpServerSocket_accept_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TcpServerSocketProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TcpServerSocket ptr;
  final String name = TcpServerSocketName;

  TcpServerSocketProxy(TcpServerSocketProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TcpServerSocketProxyCalls(proxyImpl);

  TcpServerSocketProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TcpServerSocketProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  TcpServerSocketProxy.fromHandle(core.MojoHandle handle) :
      impl = new TcpServerSocketProxyImpl.fromHandle(handle) {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  TcpServerSocketProxy.unbound() :
      impl = new TcpServerSocketProxyImpl.unbound() {
    ptr = new _TcpServerSocketProxyCalls(impl);
  }

  static TcpServerSocketProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpServerSocketProxy"));
    return new TcpServerSocketProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "TcpServerSocketProxy($impl)";
  }
}


class TcpServerSocketStub extends bindings.Stub {
  TcpServerSocket _impl = null;

  TcpServerSocketStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TcpServerSocketStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TcpServerSocketStub.unbound() : super.unbound();

  static TcpServerSocketStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TcpServerSocketStub"));
    return new TcpServerSocketStub.fromEndpoint(endpoint);
  }

  static const String name = TcpServerSocketName;


  TcpServerSocketAcceptResponseParams _TcpServerSocketAcceptResponseParamsFactory(network_error_mojom.NetworkError result, net_address_mojom.NetAddress remoteAddress) {
    var result = new TcpServerSocketAcceptResponseParams();
    result.result = result;
    result.remoteAddress = remoteAddress;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kTcpServerSocket_accept_name:
        var params = TcpServerSocketAcceptParams.deserialize(
            message.payload);
        return _impl.accept(params.sendStream,params.receiveStream,params.clientSocket,_TcpServerSocketAcceptResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTcpServerSocket_accept_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TcpServerSocket get impl => _impl;
  set impl(TcpServerSocket d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TcpServerSocketStub($superString)";
  }

  int get version => 0;
}


