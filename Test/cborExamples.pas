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


// exmaples as shown in the RFC

unit cborExamples;

interface

uses Types;

function GetExample( idx : integer ) : TByteDynArray;
function GetExampleCnt : integer;

implementation

uses
  SysUtils;


const cExamples : Array[0..71] of string =
     ( '00'
      ,'01'
      ,'0a'
      ,'17'
      ,'1818'
      ,'1819'
      ,'1864'
      ,'1903e8'
      ,'1a000f4240'
      ,'1b000000e8d4a51000'
      ,'1bffffffffffffffff'
     // ,'c249010000000000000000'   // tag bigdecimal
     // ,'3bffffffffffffffff'       // too big negative int64
     // ,'c349010000000000000000'   // tag neg bigdecimal
      ,'20'
      ,'29'
      ,'3863'
      ,'3903e7'
      ,'f90000'
      ,'f98000'
      ,'f93c00'
      ,'fb3ff199999999999a'
      ,'f93e00'
      ,'f97bff'
      ,'fa47c35000'
      ,'fa7f7fffff'
      ,'fb7e37e43c8800759c'
      ,'f90001'
      ,'f90400'
      ,'f9c400'
      ,'fbc010666666666666'
      ,'f97c00'
      ,'f97e00'
      ,'f9fc00'
      ,'fa7f800000'
      ,'fa7fc00000'
      ,'faff800000'
      ,'fb7ff0000000000000'
      ,'fb7ff8000000000000'
      ,'fbfff0000000000000'
      ,'f4'
      ,'f5'
      ,'f6'
     // ,'f7'                    // undefined
      ,'f0'
      ,'f818'
      ,'f8ff'

      ,'40'
      ,'4401020304'
      ,'60'
      ,'6161'
      ,'6449455446'
      ,'62225c'
      ,'62c3bc'
      ,'63e6b0b4'
      ,'64f0908591'
      ,'80'
      ,'83010203'
      ,'8301820203820405'
      ,'98190102030405060708090a0b0c0d0e0f101112131415161718181819'
      ,'a0'
      ,'a201020304'
      ,'a26161016162820203'
      ,'826161a161626163'
      ,'a56161614161626142616361436164614461656145'
      ,'5f42010243030405ff'
      ,'7f657374726561646d696e67ff'
      ,'9fff'
      ,'9f018202039f0405ffff'
      ,'9f01820203820405ff'
      ,'83018202039f0405ff'
      ,'83019f0203ff820405'
      ,'9f0102030405060708090a0b0c0d0e0f101112131415161718181819ff'
      ,'bf61610161629f0203ffff'
      ,'826161bf61626163ff'
      ,'bf6346756ef563416d7421ff' );

function GetExampleCnt : integer;
begin
     Result := Length(cExamples);
end;

function GetExample( idx : integer ) : TByteDynArray;
var sExample : string;
    i : Integer;
    c : char;
begin
     sExample := LowerCase( cExamples[idx] );

     SetLength( Result, Length(sExample) div 2);

     for i := 0 to Length(Result) - 1 do
     begin
          c := sExample[2*i + 1];

          if ord( c ) >= ord('a')
          then
              Result[i] := ord(c) - ord('a') + 10
          else
              Result[i] := ord(c) - ord('0');
          Result[i] := Result[i] shl 4;

          c := sExample[2*i + 2];

          if ord( c ) >= ord('a')
          then
              inc(Result[i], ord(c) - ord('a') + 10)
          else
              inc(Result[i], ord(c) - ord('0') );
     end;
end;

end.
