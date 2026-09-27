# QA Final Project Java

[![CI](https://github.com/Cristi-PredaCarp/qa-final-project-java/actions/workflows/ci.yml/badge.svg)](https://github.com/Cristi-PredaCarp/qa-final-project-java/actions/workflows/ci.yml)

Prima etapă a unui proiect QA Automation în Java/Maven. Include configurația aplicației în `config/app.yaml`, pseudocodul unui test API Arrange–Act–Assert în `src/test/java/com/cristipredacarp/tests/ApiTest.txt`, un Dockerfile și un workflow CI/CD.

## Structură

- `config/app.yaml`: mediu, URL de bază și timeout-uri.
- `data/`: director rezervat pentru datele de test.
- `src/test/java/com/cristipredacarp/tests/ApiTest.txt`: logică de test în pseudocod pentru GET `/todos/1`.
- `.github/workflows/ci.yml`: test Maven, urmat de build și publicare pe Docker Hub.

## Rulare locală

Necesită Java 17 și Maven. Din rădăcina proiectului:

```bash
mvn test
```

În această etapă nu există încă un test Java executabil: `ApiTest.txt` este pseudocod. Prin urmare, `mvn test` verifică proiectul Maven și se încheie cu succes, fără a face un request API sau a executa teste.

## Docker

Necesită Docker pornit:

```bash
docker build -t qa-final-project-java:local .
docker run --rm qa-final-project-java:local
```

Containerul rulează `mvn test` și se încheie după terminarea comenzii. Nu există server web sau port expus în această etapă.

## CI/CD și Docker Hub

Workflow-ul pornește la fiecare push pe `main`. Jobul `test` rulează `mvn test`; jobul `build-and-push` pornește numai după succesul lui `test` și publică imaginea `DOCKERHUB_USERNAME/qa-final-project-java:latest` pe Docker Hub.

În GitHub, la **Settings → Secrets and variables → Actions**, configurează următoarele repository secrets înainte de primul push:

- `DOCKERHUB_USERNAME`: numele contului Docker Hub.
- `DOCKERHUB_TOKEN`: un access token creat în Docker Hub.

Nu pune tokenul în fișierele proiectului și nu îl încărca în repository. Pentru predare, verifică în fila **Actions** că ultima rulare este verde și că imaginea a apărut în Docker Hub.
