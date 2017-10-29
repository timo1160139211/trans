package site.gaoyisheng.pojo;

public class Thesis {
    private String name;
    private int number;
	
    
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "Thesis [name=" + name + ", number=" + number + "]";
	}
    
}
