package elven.test;

import java.util.Base64;
import elven.encryption.DESede;

public class UserInfoEncryptionTest {

	public static void main(String[] args) {
		try {
			// 示例用户信息
			UserInfo user = new UserInfo("user123", "password123", "1990-01-01", "Married");

			// 生成3DES密钥
			byte[] desKey = DESede.initKey();

			// 加密用户密码
			byte[] encryptedPassword = DESede.encrypt3DES(user.getPassword().getBytes(), desKey);

			// 将加密后的密码转换为Base64字符串，以便存储和显示
			String encryptedPasswordBase64 = Base64.getEncoder().encodeToString(encryptedPassword);

			// 假设将加密的密码和其他信息存储到数据库中
			System.out.println("Storing to database: ");
			System.out.println("Account: " + user.getAccount());
			System.out.println("Encrypted Password (Base64): " + encryptedPasswordBase64);
			System.out.println("BirthDate: " + user.getBirthDate());
			System.out.println("FamilyStatus: " + user.getFamilyStatus());

			// 可以选择将Base64字符串解码并解密，以验证加密-解密过程
			byte[] decodedPassword = Base64.getDecoder().decode(encryptedPasswordBase64);
			byte[] decryptedPassword = DESede.decrypt3DES(decodedPassword, desKey);
			System.out.println("Decrypted Password: " + new String(decryptedPassword));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
