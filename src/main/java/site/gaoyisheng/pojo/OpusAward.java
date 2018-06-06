package site.gaoyisheng.pojo;

public class OpusAward {
    private Integer id;

    private String name;

    private String no1AutherType;

    private String no1AutherName;

    private String workunit;

    private String publishWorkunit;

    private String publishDate;

    private String publishLocation;

    private String opusCategory;

    private String teachingMaterialCategory;

    private String subjectType;

    private String stairSubject;

    private String projectSources;

    private String wordsNumbers;

    private String translatedForeignOrNot;

    private String schoolSign;

    private String language;

    private String isbn;

    private String cip;

    private String introduce;

    private String publishingLevel;

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

    private Integer autherNumber;

    private Integer sdutAutherNumber;

    private String status;
    

	public OpusAward() {
		super();
		this.name = "";
		this.publishLocation = "";
		this.opusCategory = "";
		this.teachingMaterialCategory = "";
		this.subjectType = "";
		this.publishDate = "";
		this.stairSubject = "";
		this.translatedForeignOrNot = "";
		this.schoolSign = "";
		this.cip = "";
		this.language = "";
		this.isbn = "";
		this.publishWorkunit = "";
		this.workunit = "";
		this.no1AutherType = "";
		this.sdutAutherNumber = 0;
		this.publishingLevel = "";
		this.autherNumber = 0;
		this.introduce = "";
		this.projectSources = "";
		this.wordsNumbers = "";
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
		this.status = "未认领";
	}
	
	/**
	 * 审核用,
	 * @param id
	 * @param status
	 */
	public OpusAward(int id,String status) {
		this.id = id;
		this.no10AutherNumber = status;
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

    public String getNo1AutherType() {
        return no1AutherType;
    }

    public void setNo1AutherType(String no1AutherType) {
        this.no1AutherType = no1AutherType == null ? null : no1AutherType.trim();
    }

    public String getNo1AutherName() {
        return no1AutherName;
    }

    public void setNo1AutherName(String no1AutherName) {
        this.no1AutherName = no1AutherName == null ? null : no1AutherName.trim();
    }

    public String getWorkunit() {
        return workunit;
    }

    public void setWorkunit(String workunit) {
        this.workunit = workunit == null ? null : workunit.trim();
    }

    public String getPublishWorkunit() {
        return publishWorkunit;
    }

    public void setPublishWorkunit(String publishWorkunit) {
        this.publishWorkunit = publishWorkunit == null ? null : publishWorkunit.trim();
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate == null ? null : publishDate.trim();
    }

    public String getPublishLocation() {
        return publishLocation;
    }

    public void setPublishLocation(String publishLocation) {
        this.publishLocation = publishLocation == null ? null : publishLocation.trim();
    }

    public String getOpusCategory() {
        return opusCategory;
    }

    public void setOpusCategory(String opusCategory) {
        this.opusCategory = opusCategory == null ? null : opusCategory.trim();
    }

    public String getTeachingMaterialCategory() {
        return teachingMaterialCategory;
    }

    public void setTeachingMaterialCategory(String teachingMaterialCategory) {
        this.teachingMaterialCategory = teachingMaterialCategory == null ? null : teachingMaterialCategory.trim();
    }

    public String getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(String subjectType) {
        this.subjectType = subjectType == null ? null : subjectType.trim();
    }

    public String getStairSubject() {
        return stairSubject;
    }

    public void setStairSubject(String stairSubject) {
        this.stairSubject = stairSubject == null ? null : stairSubject.trim();
    }

    public String getProjectSources() {
        return projectSources;
    }

    public void setProjectSources(String projectSources) {
        this.projectSources = projectSources == null ? null : projectSources.trim();
    }

    public String getWordsNumbers() {
        return wordsNumbers;
    }

    public void setWordsNumbers(String wordsNumbers) {
        this.wordsNumbers = wordsNumbers == null ? null : wordsNumbers.trim();
    }

    public String getTranslatedForeignOrNot() {
        return translatedForeignOrNot;
    }

    public void setTranslatedForeignOrNot(String translatedForeignOrNot) {
        this.translatedForeignOrNot = translatedForeignOrNot == null ? null : translatedForeignOrNot.trim();
    }

    public String getSchoolSign() {
        return schoolSign;
    }

    public void setSchoolSign(String schoolSign) {
        this.schoolSign = schoolSign == null ? null : schoolSign.trim();
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language == null ? null : language.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip == null ? null : cip.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getPublishingLevel() {
        return publishingLevel;
    }

    public void setPublishingLevel(String publishingLevel) {
        this.publishingLevel = publishingLevel == null ? null : publishingLevel.trim();
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

    public Integer getAutherNumber() {
        return autherNumber;
    }

    public void setAutherNumber(Integer autherNumber) {
        this.autherNumber = autherNumber;
    }

    public Integer getSdutAutherNumber() {
        return sdutAutherNumber;
    }

    public void setSdutAutherNumber(Integer sdutAutherNumber) {
        this.sdutAutherNumber = sdutAutherNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}