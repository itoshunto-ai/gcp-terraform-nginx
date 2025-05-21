import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 10,         // 仮想ユーザー数
  duration: '30s', // 実行時間
};

export default function () {
  http.get('http://34.146.191.180');
  sleep(1);
}

