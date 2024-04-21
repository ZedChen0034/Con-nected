package elven.test;

import java.util.Base64;
import elven.encryption.AESUtil;

/**
 * 用户信息类
 */
public class UserInfo {

    private String account;  // 账号
    private String password; // 密码
    private String birthDate; // 出生日期
    private String familyStatus; // 家庭状况

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public String getFamilyStatus() {
        return familyStatus;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public void setFamilyStatus(String familyStatus) {
        this.familyStatus = familyStatus;
    }

    // 构造方法
    public UserInfo(String account, String password, String birthDate, String familyStatus) {
        this.account = account;
        this.password = password;
        this.birthDate = birthDate;
        this.familyStatus = familyStatus;
    }



    @Override
    public String toString() {
        return "UserInfo{" +
                "account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", familyStatus='" + familyStatus + '\'' +
                '}';
    }
}


