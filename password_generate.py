# -*- coding: utf-8 -*-

import sys
import time
import hmac
import hashlib

options = {
        'productKey': 'a1w78T9VVmM',
        'deviceName': 'dev1',
        'deviceSecret': '1041d8898a6cdc5a851074c1543c98db',
        'port': 1883,
        'host': 'iot-as-mqtt.cn-shanghai.aliyuncs.com'
    }
if sys.version > '3':
    PY3 = True
else:
    PY3 = False


def get_client_id(client_id, secure_mode=2, sign_method='hmacsha1'):
    """
    获取加密后id
    :param client_id:
    :param secure_mode:
    :param sign_method:
    :return:
    """
    ts = str(int(time.time()))
    return client_id + '|securemode=' + str(secure_mode) + ',signmethod=' + sign_method + ',timestamp=' + ts + '|'


def get_sort_keys(product_key, device_name, client_id):
    """
    key排序
    :param product_key: 产品key
    :param device_name: 设备名称
    :param client_id: 客户id
    :return:
    """
    ts = str(int(time.time()))
    d = {'productKey': product_key, 'deviceName': device_name,
         'timestamp': ts, 'clientId': client_id}
    sort_d = [(k, d[k]) for k in sorted(d.keys())]

    content = ''
    for i in sort_d:
        content += str(i[0])
        content += str(i[1])
    return content


def create_signature(secret_key, text, sign_method='hmacsha1'):
    """
    生成签名
    :param secret_key:
    :param text:
    :param sign_method:
    :return:
    """
    if PY3:
        content_to_sign = bytes(text, 'utf-8')
        secret_key = bytes(secret_key, 'utf-8')
    else:
        content_to_sign = text.encode('utf-8')

    if sign_method == 'hmacsha1':
        hashed = hmac.new(secret_key, content_to_sign, hashlib.sha1)
    elif sign_method == 'hmacmd5':
        hashed = hmac.new(secret_key, content_to_sign, hashlib.md5)
    return hashed.hexdigest().upper()


if __name__ == '__main__':

    SN = 'SN'
    mqtt_client_id = get_client_id(SN, 3, 'hmacsha1')
    user_name = options['deviceName'] + '&' + options['productKey']
    ordered_keys = get_sort_keys(options['productKey'], options['deviceName'], SN)
    print("ordered_keys",ordered_keys)
    password = create_signature(options['deviceSecret'], ordered_keys)
    print("name:", options['deviceName'])
    print("clientId:", mqtt_client_id)

    print("host:", 'mqtt://', options['host'], ':', options['port'])
    print("port:", options['port'])
    print("username:", user_name)
    print("password:", password.lower())
