{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, click
, gitpython
, jinja2
, pytz
, riscv-config
, riscv-isac
}:

let
  pname = "riscof";
  version = "1.25.2";
in
buildPythonPackage {
  inherit pname version;

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ccqzmc8sh7j8ndv16kwb24djvhl7gyyckk5fia2snjppi3dlcj5";
  };

  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
    click
    gitpython
    jinja2
    pytz
    riscv-config
    riscv-isac
  ];

  postPatch = ''
    sed -Ei 's/^(GitPython)==.*/\1/' riscof/requirements.txt
    substituteInPlace riscof/cli.py \
      --replace 'copy_tree(src, dest)' 'copy_tree(src, dest, preserve_mode=0)'
  '';

  meta = with lib; {
    homepage = "https://github.com/riscv-software-src/riscof";
    description = "RISC-V architectural test framework";
    license = licenses.bsd3;
    maintainers = with maintainers; [ alexshpilkin ];
  };
}
