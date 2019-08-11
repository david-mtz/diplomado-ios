//
//  String+AES.swift
//  shopapp
//
//  Created by David on 8/11/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

extension String {
    
    function aesDecrypt($base64encodedCipherText, $key) {
    $ivSize = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
    $iv = mcrypt_create_iv($ivSize, MCRYPT_RAND);
    $cipherText = base64_decode($base64encodedCipherText);
    if (strlen($cipherText) < $ivSize) {
    throw new Exception('Missing initialization vector');
    }
    $iv = substr($cipherText, 0, $ivSize);
    $cipherText = substr($cipherText, $ivSize);
    
    $result = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $cipherText, MCRYPT_MODE_CBC, $iv);
    $result = stripPadding(rtrim($result, chr(0x0b)));
    return $result;
    }
    function addPadding($value){
    $pad = 16 - (strlen($value) % 16);
    return $value.str_repeat(chr($pad), $pad);
    }
    
    function stripPadding($value){
    $pad = ord($value[($len = strlen($value)) - 1]);
    return paddingIsValid($pad, $value) ? substr($value, 0, $len - $pad) : $value;
    }
    
    function paddingIsValid($pad, $value){
    $beforePad = strlen($value) - $pad;
    return substr($value, $beforePad) == str_repeat(substr($value, -1), $pad);
    }

}
