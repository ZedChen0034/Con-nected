package elven.test;

import elven.encryption.AESUtil;
import elven.test.UserInfo;

import java.util.Base64;

/**
 * AES加密工具测试类
 */
public class testAES {

	public static void main(String[] args) {
		try {
			// 生成密钥
			byte[] key = AESUtil.initKey();
			System.out.println("密钥: " + Base64.getEncoder().encodeToString(key));

			// 创建用户信息实例
			UserInfo user = new UserInfo("user123", "password456", "1990-01-01", "单身");

			// 将用户信息转换为字符串，以便加密。在实际情况中，您可能需要更安全的方法来处理这一步。
			String userInfoStr = user.toString();
			System.out.println("原始用户信息: " + userInfoStr);

			// 加密
			byte[] encryptedData = AESUtil.encryptAES(userInfoStr.getBytes(), key);
			String encryptedStr = Base64.getEncoder().encodeToString(encryptedData);
			System.out.println("加密后的用户信息: " + encryptedStr);

			// 解密
			byte[] decryptedData = AESUtil.decryptAES(encryptedData, key);
			String decryptedStr = new String(decryptedData);
			System.out.println("解密后的用户信息: " + decryptedStr);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}