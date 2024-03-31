package com.entity;

public class Appointment {
    private int id;
    private int UserId;
    private String fullName;
    private String gender;
    private String age;
    private String appointDate;
    private String email;
    private String phNo;
    private String disease;
    private int doctorId;
    private String address;
    private String status;

    public Appointment(){

    }

    public Appointment(int userId, String fullName, String gender, String age, String appointDate, String email, String phNo, String disease, int doctorId, String address, String status) {
        UserId = userId;
        this.fullName = fullName;
        this.gender = gender;
        this.age = age;
        this.appointDate = appointDate;
        this.email = email;
        this.phNo = phNo;
        this.disease = disease;
        this.doctorId = doctorId;
        this.address = address;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAppointDate() {
        return appointDate;
    }

    public void setAppointDate(String appointDate) {
        this.appointDate = appointDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhNo() {
        return phNo;
    }

    public void setPhNo(String phNo) {
        this.phNo = phNo;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
