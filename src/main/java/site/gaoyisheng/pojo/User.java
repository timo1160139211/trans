package site.gaoyisheng.pojo;

public class User {
    private Integer id;
    private String name;
    private String number;
    private String password;
    private String college;// 学院
    private String status;//状态:{在职,离退休,调出,去世}

    public User() {
    	this.name="";
    	this.number="";
    	this.password="";
    	this.college="";
    	this.status="";
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college == null ? null : college.trim();
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", number=" + number + ", password=" + password + ", college="
				+ college + ", status=" + status + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
}