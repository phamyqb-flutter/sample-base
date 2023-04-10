enum Environment { dev, prod }

String getEnvPath(Environment? env) {
  switch (env) {
    case Environment.prod:
      return 'environments/env.prod';
    case Environment.dev:
    default:
      return 'environments/env.dev';
  }
}