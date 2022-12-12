Basic Template for GitLab CI with integrations tests, pre-commit, badges, coverage, flake8 and mypy

* pre-commit
* gitlab ci
* badges
* integration tests

Mirror gitlab
==================
[GitLab Mirror](https://gitlab.com/GavrilovStepan01/AwesomeGitLab)

Tests
==

```
pytest tests/test.py -vv
```

Dependencies
==

```
poetry export -f requirements.txt --output requirements.txt
```

How commit ?
==

```
git add .pre-commit-config.yaml
```

```
pre-commit run
```
