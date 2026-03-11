package model;

/*
 * DTO : 데이터를 DB에 전달해주기 위한 객체
 * Bean(빈) 클래스
 */
public class Member {
	private String id; // id 입력값
	private String pass;
	private String name;
	private int gender;
	private String tel;
	private String email;
	private String picture;
	
	// getters & setters, toString
	
	public String getId() {
		return id;
	}

	public void setId(String id) { // 화면에서 입력받은 데이터 매개변수로 저장
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", tel=" + tel
				+ ", email=" + email + ", picture=" + picture + "]";
	}
	
}
