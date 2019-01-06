# SAM PoC

## Overview

Proof of concept using Serverless Application Model (SAM).

## Usage

Install dependencies:

```text
▶ brew install python@2
▶ pip install virtualenv
```

Install Docker CE ([ref](https://docs.docker.com/docker-for-mac/install/)).

Ensure you have an AWS account and access keys configured.

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

## Hello world app

### Overview

This section is based on the SAM [Quick Start](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-quick-start.html) section.

### sam init

The `sam init` command initialises a serverless application with a SAM template, a folder structure inside the directory `sam-app`, unit tests and so on. For more information, try `sam init --help`. Note the options that can be passed to `--runtime`:

```text
▶ sam init --help
...
    -r, --runtime [dotnetcore1.0|go1.x|nodejs|python|python2.7|python3.6|python3.7|ruby2.5|dotnetcore2.0|dotnetcore2.1|go|dotnet|java|nodejs4.3|nodejs6.10|java8|nodejs8.10|dotnetcore]
                                  Lambda Runtime of your app
```

I ran:

```text
▶ sam init --runtime python2.7
[+] Initializing project structure...
[SUCCESS] - Read sam-app/README.md for further instructions on how to proceed
[*] Project initialization is now complete
```

This creates four things:

1. A "hello world" app in Python 2.7 inside `sam-app/hello_world`.
2. Unit tests in Pytest for it inside `sam-app/tests`.
3. A SAM template in `sam-app/template.yml`.
4. a README.md in `sam-app/README.md` with further instructions.

