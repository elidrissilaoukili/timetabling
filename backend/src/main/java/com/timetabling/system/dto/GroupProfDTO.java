package com.timetabling.system.dto;

public class GroupProfDTO {
        private int id;
        private int profId;
        private int groupId;

        // Constructor
        public GroupProfDTO(int id, int profId, int groupId) {
            this.id = id;
            this.profId = profId;
            this.groupId = groupId;
        }

        // Getters and setters
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getProfId() {
            return profId;
        }

        public void setProfId(int profId) {
            this.profId = profId;
        }

        public int getGroupId() {
            return groupId;
        }

        public void setGroupId(int groupId) {
            this.groupId = groupId;
        }
    }

