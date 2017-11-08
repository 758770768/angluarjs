package org.angularJsDemo.pojo;

public class Dept {


	private String did;
	private String dname;
	private String dcity;
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDcity() {
		return dcity;
	}
	public void setDcity(String dcity) {
		this.dcity = dcity;
	}
	@Override
	public String toString() {
		return "Dept [did=" + did + ", dname=" + dname + ", dcity=" + dcity + "]";
	}
	
	
	
}
