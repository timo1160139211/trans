package site.gaoyisheng.pojo;

public class Patent {
	private Integer id;

	private String keyId;

	private String name;

	private String type;

	private String authorizationNumber;

	private String authorizationDate;

	private String pctPatentOrNot;

	private String pctPatentName;

	private String pctPatentApplicationNumber;

	private String pctPatentApplicationDate;

	private String pctPatentPriorityDate;

	private String inCountry;

	private String allAutherName;

	private String no1AutherNumber;

	private String no2AutherName;

	private String no2AutherNumber;

	private String no3AutherName;

	private String no3AutherNumber;

	private String no4AutherName;

	private String no4AutherNumber;

	private String no5AutherName;

	private String no5AutherNumber;

	private String no6AutherName;

	private String no6AutherNumber;

	private String no7AutherName;

	private String no7AutherNumber;

	private String no8AutherName;

	private String no8AutherNumber;

	private String no9AutherName;

	private String no9AutherNumber;

	private String no10AutherName;

	private String no10AutherNumber;

	private String claimStatus;

	private String no1AutherName;

	public Patent() {
		super();
		this.keyId = "";
		this.name = "";
		this.allAutherName = "";
		this.type = "";
		this.authorizationNumber = "";
		this.authorizationDate = "";
		this.pctPatentOrNot = "";
		this.pctPatentName = "";
		this.pctPatentApplicationNumber = "";
		this.pctPatentApplicationDate = "";
		this.pctPatentPriorityDate = "";
		this.inCountry = "";
		this.no1AutherName = "";
		this.no1AutherNumber = "";
		this.no2AutherName = "";
		this.no2AutherNumber = "";
		this.no3AutherName = "";
		this.no3AutherNumber = "";
		this.no4AutherName = "";
		this.no4AutherNumber = "";
		this.no5AutherName = "";
		this.no5AutherNumber = "";
		this.no6AutherName = "";
		this.no6AutherNumber = "";
		this.no7AutherName = "";
		this.no7AutherNumber = "";
		this.no8AutherName = "";
		this.no8AutherNumber = "";
		this.no9AutherName = "";
		this.no9AutherNumber = "";
		this.no10AutherName = "";
		this.no10AutherNumber = "未审核";
		this.claimStatus = "未认领";
	}
	
	/**
	 * 审核用,
	 * @param id
	 * @param status
	 */
	public Patent(int id,String status) {
		this.id = id;
		this.no10AutherNumber = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKeyId() {
		return keyId;
	}

	public void setKeyId(String keyId) {
		this.keyId = keyId == null ? null : keyId.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getAuthorizationNumber() {
		return authorizationNumber;
	}

	public void setAuthorizationNumber(String authorizationNumber) {
		this.authorizationNumber = authorizationNumber == null ? null : authorizationNumber.trim();
	}

	public String getAuthorizationDate() {
		return authorizationDate;
	}

	public void setAuthorizationDate(String authorizationDate) {
		this.authorizationDate = authorizationDate == null ? null : authorizationDate.trim();
	}

	public String getPctPatentOrNot() {
		return pctPatentOrNot;
	}

	public void setPctPatentOrNot(String pctPatentOrNot) {
		this.pctPatentOrNot = pctPatentOrNot == null ? null : pctPatentOrNot.trim();
	}

	public String getPctPatentName() {
		return pctPatentName;
	}

	public void setPctPatentName(String pctPatentName) {
		this.pctPatentName = pctPatentName == null ? null : pctPatentName.trim();
	}

	public String getPctPatentApplicationNumber() {
		return pctPatentApplicationNumber;
	}

	public void setPctPatentApplicationNumber(String pctPatentApplicationNumber) {
		this.pctPatentApplicationNumber = pctPatentApplicationNumber == null ? null : pctPatentApplicationNumber.trim();
	}

	public String getPctPatentApplicationDate() {
		return pctPatentApplicationDate;
	}

	public void setPctPatentApplicationDate(String pctPatentApplicationDate) {
		this.pctPatentApplicationDate = pctPatentApplicationDate == null ? null : pctPatentApplicationDate.trim();
	}

	public String getPctPatentPriorityDate() {
		return pctPatentPriorityDate;
	}

	public void setPctPatentPriorityDate(String pctPatentPriorityDate) {
		this.pctPatentPriorityDate = pctPatentPriorityDate == null ? null : pctPatentPriorityDate.trim();
	}

	public String getInCountry() {
		return inCountry;
	}

	public void setInCountry(String inCountry) {
		this.inCountry = inCountry == null ? null : inCountry.trim();
	}

	public String getAllAutherName() {
		return allAutherName;
	}

	public void setAllAutherName(String allAutherName) {
		this.allAutherName = allAutherName == null ? null : allAutherName.trim();
	}

	public String getNo1AutherNumber() {
		return no1AutherNumber;
	}

	public void setNo1AutherNumber(String no1AutherNumber) {
		this.no1AutherNumber = no1AutherNumber == null ? null : no1AutherNumber.trim();
	}

	public String getNo2AutherName() {
		return no2AutherName;
	}

	public void setNo2AutherName(String no2AutherName) {
		this.no2AutherName = no2AutherName == null ? null : no2AutherName.trim();
	}

	public String getNo2AutherNumber() {
		return no2AutherNumber;
	}

	public void setNo2AutherNumber(String no2AutherNumber) {
		this.no2AutherNumber = no2AutherNumber == null ? null : no2AutherNumber.trim();
	}

	public String getNo3AutherName() {
		return no3AutherName;
	}

	public void setNo3AutherName(String no3AutherName) {
		this.no3AutherName = no3AutherName == null ? null : no3AutherName.trim();
	}

	public String getNo3AutherNumber() {
		return no3AutherNumber;
	}

	public void setNo3AutherNumber(String no3AutherNumber) {
		this.no3AutherNumber = no3AutherNumber == null ? null : no3AutherNumber.trim();
	}

	public String getNo4AutherName() {
		return no4AutherName;
	}

	public void setNo4AutherName(String no4AutherName) {
		this.no4AutherName = no4AutherName == null ? null : no4AutherName.trim();
	}

	public String getNo4AutherNumber() {
		return no4AutherNumber;
	}

	public void setNo4AutherNumber(String no4AutherNumber) {
		this.no4AutherNumber = no4AutherNumber == null ? null : no4AutherNumber.trim();
	}

	public String getNo5AutherName() {
		return no5AutherName;
	}

	public void setNo5AutherName(String no5AutherName) {
		this.no5AutherName = no5AutherName == null ? null : no5AutherName.trim();
	}

	public String getNo5AutherNumber() {
		return no5AutherNumber;
	}

	public void setNo5AutherNumber(String no5AutherNumber) {
		this.no5AutherNumber = no5AutherNumber == null ? null : no5AutherNumber.trim();
	}

	public String getNo6AutherName() {
		return no6AutherName;
	}

	public void setNo6AutherName(String no6AutherName) {
		this.no6AutherName = no6AutherName == null ? null : no6AutherName.trim();
	}

	public String getNo6AutherNumber() {
		return no6AutherNumber;
	}

	public void setNo6AutherNumber(String no6AutherNumber) {
		this.no6AutherNumber = no6AutherNumber == null ? null : no6AutherNumber.trim();
	}

	public String getNo7AutherName() {
		return no7AutherName;
	}

	public void setNo7AutherName(String no7AutherName) {
		this.no7AutherName = no7AutherName == null ? null : no7AutherName.trim();
	}

	public String getNo7AutherNumber() {
		return no7AutherNumber;
	}

	public void setNo7AutherNumber(String no7AutherNumber) {
		this.no7AutherNumber = no7AutherNumber == null ? null : no7AutherNumber.trim();
	}

	public String getNo8AutherName() {
		return no8AutherName;
	}

	public void setNo8AutherName(String no8AutherName) {
		this.no8AutherName = no8AutherName == null ? null : no8AutherName.trim();
	}

	public String getNo8AutherNumber() {
		return no8AutherNumber;
	}

	public void setNo8AutherNumber(String no8AutherNumber) {
		this.no8AutherNumber = no8AutherNumber == null ? null : no8AutherNumber.trim();
	}

	public String getNo9AutherName() {
		return no9AutherName;
	}

	public void setNo9AutherName(String no9AutherName) {
		this.no9AutherName = no9AutherName == null ? null : no9AutherName.trim();
	}

	public String getNo9AutherNumber() {
		return no9AutherNumber;
	}

	public void setNo9AutherNumber(String no9AutherNumber) {
		this.no9AutherNumber = no9AutherNumber == null ? null : no9AutherNumber.trim();
	}

	public String getNo10AutherName() {
		return no10AutherName;
	}

	public void setNo10AutherName(String no10AutherName) {
		this.no10AutherName = no10AutherName == null ? null : no10AutherName.trim();
	}

	public String getNo10AutherNumber() {
		return no10AutherNumber;
	}

	public void setNo10AutherNumber(String no10AutherNumber) {
		this.no10AutherNumber = no10AutherNumber == null ? null : no10AutherNumber.trim();
	}

	public String getClaimStatus() {
		return claimStatus;
	}

	public void setClaimStatus(String claimStatus) {
		this.claimStatus = claimStatus == null ? null : claimStatus.trim();
	}

	public String getNo1AutherName() {
		return no1AutherName;
	}

	public void setNo1AutherName(String no1AutherName) {
		this.no1AutherName = no1AutherName == null ? null : no1AutherName.trim();
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Patent [id=");
		builder.append(id);
		builder.append(", keyId=");
		builder.append(keyId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", type=");
		builder.append(type);
		builder.append(", authorizationNumber=");
		builder.append(authorizationNumber);
		builder.append(", authorizationDate=");
		builder.append(authorizationDate);
		builder.append(", pctPatentOrNot=");
		builder.append(pctPatentOrNot);
		builder.append(", pctPatentName=");
		builder.append(pctPatentName);
		builder.append(", pctPatentApplicationNumber=");
		builder.append(pctPatentApplicationNumber);
		builder.append(", pctPatentApplicationDate=");
		builder.append(pctPatentApplicationDate);
		builder.append(", pctPatentPriorityDate=");
		builder.append(pctPatentPriorityDate);
		builder.append(", inCountry=");
		builder.append(inCountry);
		builder.append(", allAutherName=");
		builder.append(allAutherName);
		builder.append(", no1AutherNumber=");
		builder.append(no1AutherNumber);
		builder.append(", no2AutherName=");
		builder.append(no2AutherName);
		builder.append(", no2AutherNumber=");
		builder.append(no2AutherNumber);
		builder.append(", no3AutherName=");
		builder.append(no3AutherName);
		builder.append(", no3AutherNumber=");
		builder.append(no3AutherNumber);
		builder.append(", no4AutherName=");
		builder.append(no4AutherName);
		builder.append(", no4AutherNumber=");
		builder.append(no4AutherNumber);
		builder.append(", no5AutherName=");
		builder.append(no5AutherName);
		builder.append(", no5AutherNumber=");
		builder.append(no5AutherNumber);
		builder.append(", no6AutherName=");
		builder.append(no6AutherName);
		builder.append(", no6AutherNumber=");
		builder.append(no6AutherNumber);
		builder.append(", no7AutherName=");
		builder.append(no7AutherName);
		builder.append(", no7AutherNumber=");
		builder.append(no7AutherNumber);
		builder.append(", no8AutherName=");
		builder.append(no8AutherName);
		builder.append(", no8AutherNumber=");
		builder.append(no8AutherNumber);
		builder.append(", no9AutherName=");
		builder.append(no9AutherName);
		builder.append(", no9AutherNumber=");
		builder.append(no9AutherNumber);
		builder.append(", no10AutherName=");
		builder.append(no10AutherName);
		builder.append(", no10AutherNumber=");
		builder.append(no10AutherNumber);
		builder.append(", claimStatus=");
		builder.append(claimStatus);
		builder.append(", no1AutherName=");
		builder.append(no1AutherName);
		builder.append("]");
		return builder.toString();
	}

}