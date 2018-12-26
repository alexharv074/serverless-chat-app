# SAM PoC

## Overview

Proof of concept using Serverless Application Model (SAM).

## Usage

Install dependencies:

```text
▶ brew install python@2
▶ pip install virtualenv
```

Set up a Virtualenv:

```text
▶ virtualenv ./virtualenv
▶ . virtualenv/bin/activate
▶ pip install -r requirements.txt
```

Test it's working:

```text
▶ sam --version 
SAM CLI, version 0.10.0
```

Cleanup:

```text
▶ deactivate
```

Return to the Virtualenv later without reinstalling:

```text
▶ . virtualenv/bin/activate
▶ sam --version
SAM CLI, version 0.10.0
```

Useful docs:

- [Use Python effectively on Mac OS X](http://blog.manbolo.com/2014/09/27/use-python-effectively-on-os-x).
- [My Stack Overflow question](https://stackoverflow.com/q/53913862/3787051).
