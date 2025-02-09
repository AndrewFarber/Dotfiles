{ pkgs, ...}:

pkgs.mkShell {
  name = "ai";
  buildInputs = [
    pkgs.cudaPackages.cudatoolkit
    pkgs.cudaPackages.cudnn
    pkgs.python312
    pkgs.python312Packages.alembic
    pkgs.python312Packages.cvxpy
    pkgs.python312Packages.datasets
    pkgs.python312Packages.fastapi
    pkgs.python312Packages.httpx
    pkgs.python312Packages.huggingface-hub
    pkgs.python312Packages.jinja2
    pkgs.python312Packages.jupyterlab
    pkgs.python312Packages.langchain
    pkgs.python312Packages.matplotlib
    pkgs.python312Packages.mypy
    pkgs.python312Packages.numpy
    pkgs.python312Packages.pandas
    pkgs.python312Packages.pip
    pkgs.python312Packages.psycopg
    pkgs.python312Packages.pydantic
    pkgs.python312Packages.pydantic-settings
    pkgs.python312Packages.pyodbc
    pkgs.python312Packages.pytest
    pkgs.python312Packages.python-multipart
    pkgs.python312Packages.requests
    pkgs.python312Packages.ruff
    pkgs.python312Packages.scikit-learn
    pkgs.python312Packages.scipy
    pkgs.python312Packages.sqlalchemy
    pkgs.python312Packages.statsmodels
    pkgs.python312Packages.torch-bin
    pkgs.python312Packages.torchaudio-bin
    pkgs.python312Packages.torchvision-bin
    pkgs.python312Packages.transformers
    pkgs.python312Packages.uv
    pkgs.python312Packages.uvicorn
    pkgs.python312Packages.setuptools
  ];
  shell = pkgs.zsh;
  shellHook = ''
    export PATH=${pkgs.cudaPackages.cudatoolkit}/bin:$PATH
    export CUDA_HOME=${pkgs.cudaPackages.cudatoolkit}
    export CUDA_PATH=${pkgs.cudaPackages.cudatoolkit}
    # export LD_LIBRARY_PATH=${pkgs.cudaPackages.cudatoolkit}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/lib/wsl/lib:${pkgs.cudaPackages.cudatoolkit}/lib
    exec ${pkgs.zsh}/bin/zsh
  '';
}

