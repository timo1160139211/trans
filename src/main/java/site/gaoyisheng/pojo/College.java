package site.gaoyisheng.pojo;

public class College {
    private Integer id;

    private String name;

    private String a;

    public College() {
    	super();
    	this.name = "";
    	this.a = "";
    }
    
    public College(String name) {
    	super();
    	this.name = name;
    	this.a = "";
    }
    
    public College(int id,String name) {
    	super();
    	this.id = id;
    	this.name = name;
    	this.a = "";
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

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a == null ? null : a.trim();
    }
}