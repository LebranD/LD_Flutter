

const bool isDebugEnviorment = false;

String get apiHost {
  return isDebugEnviorment ? 'http://api.test-tw.sigcms.com' : 'https://api.zhangyunbook.cn';
}