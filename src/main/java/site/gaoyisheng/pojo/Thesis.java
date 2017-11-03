package site.gaoyisheng.pojo;

public class Thesis {
    private Integer id;

    private String type;

    private String name;

    private String no1AutherType;

    private String no1AutherName;

    private String communicateAutherName;

    private String workunit;

    private String otherAutherName;

    private String publishDate;

    private String publishMagazineThesisSet;

    private String magazineType;

    private String subjectType;

    private String stairSubject;

    private String projectSources;

    private String publishRange;

    private String thesisSetPublisher;

    private String wordsNumbers;

    private String schoolSign;

    private String keyWords;

    private String theAbstract;

    private String note;

    private String appearance;

    private String cnkiLink;

    private String issn;

    private String cn;

    private String volumeNumberPage;

    private String doi;

    private String conferenceName;

    private String conferenceSite;

    private String conferenceDate;

    private String embodyNumber;

    private String translationOrNot;

    private String referenceFrequency;

    private String supportProject;

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

    /**
     * 第一作者工号.
     */
    private String no1AutherNumber;

    /**
     * sdut作者数量.
     */
    private Integer autherNumber;

    private Integer sdutAutherNumber;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
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

    public String getCommunicateAutherName() {
        return communicateAutherName;
    }

    public void setCommunicateAutherName(String communicateAutherName) {
        this.communicateAutherName = communicateAutherName == null ? null : communicateAutherName.trim();
    }

    public String getWorkunit() {
        return workunit;
    }

    public void setWorkunit(String workunit) {
        this.workunit = workunit == null ? null : workunit.trim();
    }

    public String getOtherAutherName() {
        return otherAutherName;
    }

    public void setOtherAutherName(String otherAutherName) {
        this.otherAutherName = otherAutherName == null ? null : otherAutherName.trim();
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate == null ? null : publishDate.trim();
    }

    public String getPublishMagazineThesisSet() {
        return publishMagazineThesisSet;
    }

    public void setPublishMagazineThesisSet(String publishMagazineThesisSet) {
        this.publishMagazineThesisSet = publishMagazineThesisSet == null ? null : publishMagazineThesisSet.trim();
    }

    public String getMagazineType() {
        return magazineType;
    }

    public void setMagazineType(String magazineType) {
        this.magazineType = magazineType == null ? null : magazineType.trim();
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

    public String getPublishRange() {
        return publishRange;
    }

    public void setPublishRange(String publishRange) {
        this.publishRange = publishRange == null ? null : publishRange.trim();
    }

    public String getThesisSetPublisher() {
        return thesisSetPublisher;
    }

    public void setThesisSetPublisher(String thesisSetPublisher) {
        this.thesisSetPublisher = thesisSetPublisher == null ? null : thesisSetPublisher.trim();
    }

    public String getWordsNumbers() {
        return wordsNumbers;
    }

    public void setWordsNumbers(String wordsNumbers) {
        this.wordsNumbers = wordsNumbers == null ? null : wordsNumbers.trim();
    }

    public String getSchoolSign() {
        return schoolSign;
    }

    public void setSchoolSign(String schoolSign) {
        this.schoolSign = schoolSign == null ? null : schoolSign.trim();
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords == null ? null : keyWords.trim();
    }

    public String getTheAbstract() {
        return theAbstract;
    }

    public void setTheAbstract(String theAbstract) {
        this.theAbstract = theAbstract == null ? null : theAbstract.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getAppearance() {
        return appearance;
    }

    public void setAppearance(String appearance) {
        this.appearance = appearance == null ? null : appearance.trim();
    }

    public String getCnkiLink() {
        return cnkiLink;
    }

    public void setCnkiLink(String cnkiLink) {
        this.cnkiLink = cnkiLink == null ? null : cnkiLink.trim();
    }

    public String getIssn() {
        return issn;
    }

    public void setIssn(String issn) {
        this.issn = issn == null ? null : issn.trim();
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn == null ? null : cn.trim();
    }

    public String getVolumeNumberPage() {
        return volumeNumberPage;
    }

    public void setVolumeNumberPage(String volumeNumberPage) {
        this.volumeNumberPage = volumeNumberPage == null ? null : volumeNumberPage.trim();
    }

    public String getDoi() {
        return doi;
    }

    public void setDoi(String doi) {
        this.doi = doi == null ? null : doi.trim();
    }

    public String getConferenceName() {
        return conferenceName;
    }

    public void setConferenceName(String conferenceName) {
        this.conferenceName = conferenceName == null ? null : conferenceName.trim();
    }

    public String getConferenceSite() {
        return conferenceSite;
    }

    public void setConferenceSite(String conferenceSite) {
        this.conferenceSite = conferenceSite == null ? null : conferenceSite.trim();
    }

    public String getConferenceDate() {
        return conferenceDate;
    }

    public void setConferenceDate(String conferenceDate) {
        this.conferenceDate = conferenceDate == null ? null : conferenceDate.trim();
    }

    public String getEmbodyNumber() {
        return embodyNumber;
    }

    public void setEmbodyNumber(String embodyNumber) {
        this.embodyNumber = embodyNumber == null ? null : embodyNumber.trim();
    }

    public String getTranslationOrNot() {
        return translationOrNot;
    }

    public void setTranslationOrNot(String translationOrNot) {
        this.translationOrNot = translationOrNot == null ? null : translationOrNot.trim();
    }

    public String getReferenceFrequency() {
        return referenceFrequency;
    }

    public void setReferenceFrequency(String referenceFrequency) {
        this.referenceFrequency = referenceFrequency == null ? null : referenceFrequency.trim();
    }

    public String getSupportProject() {
        return supportProject;
    }

    public void setSupportProject(String supportProject) {
        this.supportProject = supportProject == null ? null : supportProject.trim();
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

    public String getNo1AutherNumber() {
        return no1AutherNumber;
    }

    public void setNo1AutherNumber(String no1AutherNumber) {
        this.no1AutherNumber = no1AutherNumber == null ? null : no1AutherNumber.trim();
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

	@Override
	public String toString() {
		return "Thesis [id=" + id + ", type=" + type + ", name=" + name + ", no1AutherType=" + no1AutherType
				+ ", no1AutherName=" + no1AutherName + ", communicateAutherName=" + communicateAutherName
				+ ", workunit=" + workunit + ", otherAutherName=" + otherAutherName + ", publishDate=" + publishDate
				+ ", publishMagazineThesisSet=" + publishMagazineThesisSet + ", magazineType=" + magazineType
				+ ", subjectType=" + subjectType + ", stairSubject=" + stairSubject + ", projectSources="
				+ projectSources + ", publishRange=" + publishRange + ", thesisSetPublisher=" + thesisSetPublisher
				+ ", wordsNumbers=" + wordsNumbers + ", schoolSign=" + schoolSign + ", keyWords=" + keyWords
				+ ", theAbstract=" + theAbstract + ", note=" + note + ", appearance=" + appearance + ", cnkiLink="
				+ cnkiLink + ", issn=" + issn + ", cn=" + cn + ", volumeNumberPage=" + volumeNumberPage + ", doi=" + doi
				+ ", conferenceName=" + conferenceName + ", conferenceSite=" + conferenceSite + ", conferenceDate="
				+ conferenceDate + ", embodyNumber=" + embodyNumber + ", translationOrNot=" + translationOrNot
				+ ", referenceFrequency=" + referenceFrequency + ", supportProject=" + supportProject
				+ ", no2AutherName=" + no2AutherName + ", no2AutherNumber=" + no2AutherNumber + ", no3AutherName="
				+ no3AutherName + ", no3AutherNumber=" + no3AutherNumber + ", no4AutherName=" + no4AutherName
				+ ", no4AutherNumber=" + no4AutherNumber + ", no5AutherName=" + no5AutherName + ", no5AutherNumber="
				+ no5AutherNumber + ", no6AutherName=" + no6AutherName + ", no6AutherNumber=" + no6AutherNumber
				+ ", no7AutherName=" + no7AutherName + ", no7AutherNumber=" + no7AutherNumber + ", no8AutherName="
				+ no8AutherName + ", no8AutherNumber=" + no8AutherNumber + ", no9AutherName=" + no9AutherName
				+ ", no9AutherNumber=" + no9AutherNumber + ", no10AutherName=" + no10AutherName + ", no10AutherNumber="
				+ no10AutherNumber + ", no1AutherNumber=" + no1AutherNumber + ", autherNumber=" + autherNumber
				+ ", sdutAutherNumber=" + sdutAutherNumber + ", status=" + status + "]";
	}
    
    
}