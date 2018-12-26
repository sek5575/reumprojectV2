package com.reum.product;

import java.util.ArrayList;

public class ProductVO {
	
private int productSeq;
private String productName;
private String productRegdate;
private String productDescription;
private String productPrice;
private String productStatus;
private String productDel;
private int locSeq;
private int cateSeq;
private String locName;

private ProductPicVO productPicVO;

private ArrayList<ProductPicVO> pvolist;

private String mode;


private int currentPage;
private int startSeq;
private int endSeq;


public int getCurrentPage() {
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}
public int getStartSeq() {
	return startSeq;
}
public void setStartSeq(int startSeq) {
	this.startSeq = startSeq;
}
public int getEndSeq() {
	return endSeq;
}
public void setEndSeq(int endSeq) {
	this.endSeq = endSeq;
}
public String getMode() {
	return mode;
}
public void setMode(String mode) {
	this.mode = mode;
}
public String getLocName() {
	return locName;
}
public void setLocName(String locName) {
	this.locName = locName;
}
public ProductPicVO getProductPicVO() {
	return productPicVO;
}
public void setProductPicVO(ProductPicVO productPicVO) {
	this.productPicVO = productPicVO;
}
public ArrayList<ProductPicVO> getPvolist() {
	return pvolist;
}
public void setPvolist(ArrayList<ProductPicVO> pvolist) {
	this.pvolist = pvolist;
}
public int getProductSeq() {
	return productSeq;
}
public void setProductSeq(int productSeq) {
	this.productSeq = productSeq;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getProductRegdate() {
	return productRegdate;
}
public void setProductRegdate(String productRegdate) {
	this.productRegdate = productRegdate;
}
public String getProductDescription() {
	return productDescription;
}
public void setProductDescription(String productDescription) {
	this.productDescription = productDescription;
}
public String getProductPrice() {
	return productPrice;
}
public void setProductPrice(String productPrice) {
	this.productPrice = productPrice;
}
public String getProductStatus() {
	return productStatus;
}
public void setProductStatus(String productStatus) {
	this.productStatus = productStatus;
}
public String getProductDel() {
	return productDel;
}
public void setProductDel(String productDel) {
	this.productDel = productDel;
}
public int getLocSeq() {
	return locSeq;
}
public void setLocSeq(int locSeq) {
	this.locSeq = locSeq;
}
public int getCateSeq() {
	return cateSeq;
}
public void setCateSeq(int cateSeq) {
	this.cateSeq = cateSeq;
}


}
