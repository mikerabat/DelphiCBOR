// ###################################################################
// #### This file is part of the mathematics library project, and is
// #### offered under the licence agreement described on
// #### http://www.mrsoft.org/
// ####
// #### Copyright:(c) 2019, Michael R. . All rights reserved.
// ####
// #### Unless required by applicable law or agreed to in writing, software
// #### distributed under the License is distributed on an "AS IS" BASIS,
// #### WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// #### See the License for the specific language governing permissions and
// #### limitations under the License.
// ###################################################################

unit ufrmCBORTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit;

// a simple test application that shows the en/decoding capabilities

type
  TfrmCBORTest = class(TForm)
    edJSON: TJvFilenameEdit;
    btnOpen: TButton;
    memLog: TMemo;
    btnEncode: TButton;
    btnRFCTests: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnEncodeClick(Sender: TObject);
    procedure btnRFCTestsClick(Sender: TObject);
  private
  public
    { Public-Deklarationen }
  end;

var
  frmCBORTest: TfrmCBORTest;

implementation

uses superObject, cbor, cborExamples, Types;

{$R *.dfm}

procedure TfrmCBORTest.btnOpenClick(Sender: TObject);
var cred : ISuperObject;
    fs : TStringList;
    s : string;
    items : TCborItem;
begin
     fs := TStringList.Create;
     try
        fs.LoadFromFile(edJSON.FileName);
        cred := SO(fs.Text);
     finally
            fs.Free;
     end;

     s := cred.S['response.attestationObject'];

     items := TCborDecoding.DecodeBase64Url( s );
     memLog.Lines.Add('Found type ' + intToStr(Integer(items.CBorType)));

     case items.cborType of
       majUnsignedInt: MemLog.Lines.Add('UINt: ' + items.ToString );
       majNegInt:      MemLog.Lines.Add('negINt: ' + items.ToString );
       majByteStr:     MemLog.Lines.Add('Rawstrt: ' + items.ToString);
       majUTFEncStr:   MemLog.Lines.Add('UTF8: ' + items.ToString);
       majArray:       MemLog.Lines.Add('ARR: Length: ' + IntToStr( (items as TCborArr).Count ) + ': ' + items.ToString);
       majMap:         MemLog.Lines.Add('Map: Length: ' + IntToStr( (items as TCborMap).Count) + ': ' + items.ToString);
       majTag:         MemLog.Lines.Add('Tag - not implemented');
       majFloat:       MemLog.Lines.Add('Float: ' + items.ToString );
     end;

     with TStringList.Create do
     try
        Add( items.ToString);
        SaveToFile('D:\attestationJSON.json', TEncoding.ASCII);
     finally
            Free;
     end;
end;

procedure TfrmCBORTest.btnEncodeClick(Sender: TObject);
var encList : TCborArr;
    map : TCborMap;
    arr : TCborArr;
    arr1 : TCborArr;
    fs : TFileStream;
begin
     encList := TCborArr.Create;
     try
        // some integers
        encList.Add( TCborUINTItem.Create( 1 ) );
        encList.Add( TCborUINTItem.Create( 15 ) );
        encList.Add( TCborUINTItem.Create( $18 ) );
        encList.Add( TCborUINTItem.Create( High(Word) ) );
        encList.Add( TCborUINTItem.Create( High(LongWord) ) );

        encList.Add( TCborNegIntItem.Create( -1 ) );
        encList.Add( TCborNegIntItem.Create( -15 ) );
        encList.Add( TCborNegIntItem.Create( -$18 ) );
        encList.Add( TCborNegIntItem.Create( -High(Word) ) );
        encList.Add( TCborNegIntItem.Create( -(High(LongWord) - 1) ) );


        // some arrays
        arr := TCborArr.Create;
        arr.Add( TCborUINTItem.Create(1));
        arr.Add( TCborUINTItem.Create(2));
        arr.Add( TCborUINTItem.Create(3));

        arr1 := TCborArr.Create;
        arr1.Add( TCborNegIntItem.Create(-1));
        arr1.Add( TCborNegIntItem.Create(-2));
        arr.Add(arr1);

        encList.Add(arr);

        // a map
        map := TCborMap.Create;
        map.Add( TCborUtf8String.Create('Test1'), TCborFloat.Create(0.5) );
        map.Add( TCborUTF8String.Create('test2'), TCborUtf8String.Create('Hallo _ Hallo Hallo _ Hallo Hallo _ Hallo Hallo _ Hallo'));
        map.Add( TCborUtf8String.Create('Test3'), TCborFloat.Create(1.221) );
        map.Add( TCborUtf8String.Create('Test3'), TCborByteString.Create('1.221') );

        arr := TCborArr.Create;
        arr.Add( TCborUINTItem.Create(1));
        arr.Add( TCborUINTItem.Create(2));
        arr.Add( TCborUINTItem.Create(3));

        map.Add( TCborUtf8String.Create('Test4'), arr );

        encList.Add(map);

        fs := TFileStream.Create('D:\cbor.bin', fmCreate or fmOpenWrite);
        try
           encList.CBOREncode( fs );

           memLog.Lines.Add( encList.ToString );
           memLog.Lines.Add('');
           memLog.Lines.Add('Reimported:');

           fs.Position := 0;
           FreeAndNil(encList);
           encList := TCborDecoding.Decode( fs ) as TCborArr;
           memLog.Lines.Add(encList.ToString);
        finally
               fs.Free;
        end;
     finally
            encList.Free;
     end;
end;

procedure TfrmCBORTest.btnRFCTestsClick(Sender: TObject);
var i : integer;
    cbor : TByteDynArray;
begin
     memLog.Lines.Clear;

     for i := 0 to GetExampleCnt - 1 do
     begin
          memLog.Lines.Add('Test ' + IntToStr(i + 1) + ':' );

          cbor := GetExample(i);

          try
          with TCborDecoding.DecodeData( @cbor[0], Length(cbor) ) do
          try
             memLog.Lines.Add( ToString );
          finally
                 Free;
          end;
          except
          with TCborDecoding.DecodeData( @cbor[0], Length(cbor) ) do
          try
             memLog.Lines.Add( ToString );
          finally
                 Free;
          end;

          end;
     end;
end;

end.
