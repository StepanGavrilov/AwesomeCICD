Basic Template for GitLab CI with integrations tests, pre-commit, badges, coverage, flake8 and mypy

* pre-commit
* gitlab ci
* badges
* integration tests
* coverage & junit
* flake & black & mypy
* docker-compose

Mirror gitlab
==================
[GitLab Mirror](https://gitlab.com/GavrilovStepan01/AwesomeGitLab)

How commit ?
==

```shell
git add .pre-commit-config.yaml
```

```shell
pre-commit run --all-files --show-diff-on-failure
```

```shell
pre-commit clean
```

Start
==

```shell
  ./env.sh Development >> .env && docker-compose -f docker-compose.yml up --build

```
