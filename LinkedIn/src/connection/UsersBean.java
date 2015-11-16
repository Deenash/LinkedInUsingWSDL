package connection;

//import java.sql.Date;

public class UsersBean {
	
	private String emailid;
	private String password;
	private String firstname;
	private String lastname;
	private String city;
	private String mobile;
	private String lastloggedin;
	private String education;
	private String projects;
	private String companies;
	private String skills;
	private String experience;
	private Boolean valid;
	private String errorMessage;
	
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLastloggedin() {
		return lastloggedin;
	}
	public void setLastloggedin(String lastloggedin) {
		this.lastloggedin = lastloggedin;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getProjects() {
		return projects;
	}
	public void setProjects(String projects) {
		this.projects = projects;
	}
	public String getCompanies() {
		return companies;
	}
	public void setCompanies(String companies) {
		this.companies = companies;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public Boolean getValidate() {
		return valid;
	}
	public void setValidate(Boolean validate) {
		this.valid = validate;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	

}
