package com.techelevator.model;

import java.util.List;

public class Deck {
    private int deckId;
    private int userId;
    private String deckTitle;
    private String coverImg;
    private String deckDescription;
    private boolean pendingApproval;
    private boolean isApproved;
    private int adminId;


    public String getDeckDescription() {
        return deckDescription;
    }

    public void setDeckDescription(String deckDescription) {
        this.deckDescription = deckDescription;
    }

    public int getAdminId() {
        return adminId;
    }

    public int getDeckId() {
        return deckId;
    }

    public void setDeckId(int deckId) {
        this.deckId = deckId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDeckTitle() {
        return deckTitle;
    }

    public void setDeckTitle(String deckTitle) {
        this.deckTitle = deckTitle;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public boolean isPendingApproval() {
        return this.pendingApproval;
    }

    public void setPendingApproval(boolean pendingApproval) {
        this.pendingApproval = pendingApproval;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    @Override
    public String toString() {
        return "Deck{" +
                "deckId=" + deckId +
                ", userId=" + userId +
                ", deckTitle='" + deckTitle + '\'' +
                ", coverImg='" + coverImg + '\'' +
                ", deckDescription='" + deckDescription + '\'' +
                ", pendingApproval=" + pendingApproval +
                ", isApproved=" + isApproved +
                ", adminId=" + adminId +
                '}';
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
}
