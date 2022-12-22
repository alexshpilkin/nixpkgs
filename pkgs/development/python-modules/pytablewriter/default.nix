{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, beautifulsoup4
, dataproperty
, dominate
, elasticsearch
, idna
, loguru
, mbstrdecoder
, pandas
, pathvalidate
, pytablereader
, pytablewriter-altrow-theme
, pytest
, pytest-md-report
, pyyaml
, simplejson
, simplesqlite
, sqliteschema
, tabledata
, tablib
, tcolorpy
, toml
, typepy
, XlsxWriter
, xlwt
, doCheck ? true
, withExcel ? true
, withES7 ? true
, withFrom ? true
, withHTML ? true
, withLogging ? true
, withSQLite ? true
, withTOML ? true
, withYAML ? true
}:

let
  pname = "pytablewriter";
  version = "0.64.2";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1fqdnjppch0jf6gp1bzvrgjaylrhird2c3y43dnz1xbf3m09sh4r";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    dataproperty
    mbstrdecoder
    pathvalidate
    simplejson
    tabledata
    tcolorpy
    typepy
  ] ++ lib.optionals withExcel [ XlsxWriter xlwt ]
    ++ lib.optional withES7 elasticsearch
    ++ lib.optional withFrom pytablereader
    ++ lib.optional withHTML dominate
    ++ lib.optional withLogging loguru
    ++ lib.optional withSQLite simplesqlite
    ++ lib.optional withTOML toml
    ++ lib.optional withYAML pyyaml;
  checkInputs = [
    beautifulsoup4
    idna
    pandas
    pytablereader
    (pytablewriter-altrow-theme.override { doCheck = false; })
    pytest
    sqliteschema
    tablib
  ];

  inherit doCheck;
  checkPhase = "pytest";

  meta = with lib; {
    homepage = "https://github.com/thombashi/pytablewriter";
    description = "Python library to write a table in various formats";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
