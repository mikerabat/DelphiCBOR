# Delphi CBOR

Simple Delphi CBOR (Concise Binary Object Representation) implementation

## Installation ##

Simply add the file _cbor.pas_ to the project or add the base path to the library path.
Feel free to create a package that includes this file. 

For encoding and decoding base64 and base64url data streams this library uses the base functionality provided
by the Indy project which is widely used. 

The file is compatible with at least Delphi 2009 and uses the capabilites of Unicode conversion implemented
since this version. There are no other fancy features used.

## Exmaple ##

There is an example project provided that shows some simple encodings/decodings. One base usage of this library will be
to decode/encode CBOR data streams in conjunction with the FIDO2 standard so I provided a test json file generated
by _https://webauthn.io/_ to test the decoding process. 

The example project uses some controls from the JEDI project which is also open source and can be found here:
https://wiki.delphi-jedi.org/wiki/JEDI_Visual_Component_Library

## Limitations ##

The current status does not allow tagging of objects. Tagging will raise "ECBORNotImplemented" exceptions.

Although you can read chunked arrays or strings it is not possible to write such strings. They are always written
as full strings.

There is no reading from a stream implemented which pushes CBOR objects as they arrive in the stream - there was simply
no known use case for me here (but hey if one knows one then let me know ;)