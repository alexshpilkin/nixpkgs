{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, mbstrdecoder
, typepy
}:

let
  pname = "DataProperty";
  version = "0.55.0";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ykris1ipa57glq4s7sfdfhxb9lyhnma389q0hhnhf8jic7z3k3k";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [ mbstrdecoder typepy ];
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/thombashi/DataProperty";
    description = "Python library to extract property from data";
    license = licenses.mit;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
