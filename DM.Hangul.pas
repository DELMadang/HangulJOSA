﻿//------------------------------------------------------------------------------
//    _____       _                     _
//   |  __ \     | |                   | |
//   | |  | | ___| |_ __ ___   __ _  __| | __ _ _ __   __ _
//   | |  | |/ _ \ | '_ ` _ \ / _` |/ _` |/ _` | '_ \ / _` |
//   | |__| |  __/ | | | | | | (_| | (_| | (_| | | | | (_| |
//   |_____/ \___|_|_| |_| |_|\__,_|\__,_|\__,_|_| |_|\__, |
//                                                     __/ |
//                                                    |___/
//
//------------------------------------------------------------------------------
// 조사는 자립형태소, 조사, 어미 등의 뒤에 붙어서 다른 말과의 문법적인 관계를
// 나타내거나 뜻을 더해주는 품사입니다.
// 조사에는 수식하는 체언에 따라서
// 주격, 서술격, 관형격, 목적격, 보격, 부사격 조사 등으로 구분되며
// 조사 자체만으로는 의미가 없지만 체언과 함께 문장을 구성하게 됩니다
//------------------------------------------------------------------------------
unit DM.Hangul;

interface

uses
  System.SysUtils;

type
  Thangul = record
    class function GetJongung(const AText: string): Integer; static;
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
    /// <summary>
    /// 와/과
    /// </summary>
    class function Wa(const AText: string): string; static;
  end;

implementation

{ Thangul }

class function Thangul.GetJongung(const AText: string): Integer;
var
  LLastChar: Char;
  LUnicodeValue: Word;
begin
  Result := 0;
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
    Result := ((LUnicodeValue - $AC00) mod 28);
  end;
end;

class function Thangul.Iga(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('가', '이');
var
  LJongsung: Boolean;
begin
  LJongsung := (GetJongung(AText) > 0);
  Result := AText + JOSA[LJongsung];
end;

class function Thangul.Ro(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('로', '으로');
var
  LJongsung: Integer;
begin
  LJongsung := GetJongung(AText);
  if (LJongsung > 0) then
    Result := AText + JOSA[(LJongsung <> 8)]
  else
    Result := AText + JOSA[False];
end;

class function Thangul.Ul(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('를', '을');
var
  LJongsung: Boolean;
begin
  LJongsung := (GetJongung(AText) > 0);
  Result := AText + JOSA[LJongsung];
end;

class function Thangul.Wa(const AText: string): string;
const
  JOSA: array[Boolean] of string = ('와', '과');
var
  LJongsung: Boolean;
begin
  LJongsung := (GetJongung(AText) > 0);
  Result := AText + JOSA[LJongsung];
end;

end.
