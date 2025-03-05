//------------------------------------------------------------------------------
//    _____       _                     _
//   |  __ \     | |                   | |
//   | |  | | ___| |_ __ ___   __ _  __| | __ _ _ __   __ _
//   | |  | |/ _ \ | '_ ` _ \ / _` |/ _` |/ _` | '_ \ / _` |
//   | |__| |  __/ | | | | | | (_| | (_| | (_| | | | | (_| |
//   |_____/ \___|_|_| |_| |_|\__,_|\__,_|\__,_|_| |_|\__, |
//                                                     __/ |
//                                                    |___/
//------------------------------------------------------------------------------
unit DM.Hangul;

interface

uses
  System.SysUtils;

type
  Thangul = record
  private
    class function HasJongung(const AText: string): Boolean; static;
  public
    /// <summary>
    /// 이/가
    /// </summary>
    class function Iga(const AText: string): string; static;
    /// <summary>
    /// 로/으로
    /// </summary>
    class function Ro(const AText: string): string; static;
    /// <summary>
    /// 을/를
    /// </summary>
    class function Ul(const AText: string): string; static;
  end;

implementation

{ Thangul }

class function Thangul.HasJongung(const AText: string): Boolean;
var
  LLastChar: Char;
  LUnicodeValue: Word;
begin
  Result := False;
  if Length(AText) = 0 then
  begin
    Exit;
  end;

  // 마지막 문자 추출
  LLastChar := AText[Length(AText)];

  // 한글 유니코드 범위 확인 (44032 ~ 55203)
  LUnicodeValue := Ord(LLastChar);
  if (LUnicodeValue >= $AC00) and (LUnicodeValue <= $D7A3) then
  begin
    // 받침 여부 확인 (유니코드 값을 이용한 계산)
    Result := ((LUnicodeValue - $AC00) mod 28) > 0;
  end;
end;

class function Thangul.Iga(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('가', '이');
begin
  Result := AText + JOSA[HasJongung(AText)];
end;

class function Thangul.Ro(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('로', '으로');
begin
  { TODO : 종성이 'ㄹ '로 끝나는 경우는 으로가 아닌 로로 처리해야 한다 }
  Result := AText + JOSA[HasJongung(AText)];
end;

class function Thangul.Ul(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('를', '을');
begin
  Result := AText + JOSA[HasJongung(AText)];
end;

end.
