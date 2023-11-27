<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
    String user = "chu";
    String password = "0725";

    // Update for "member" Table
    String memberId = request.getParameter("memberId");
    String newMemberId = request.getParameter("newMemberId");
    String newMemberName = request.getParameter("newMemberName");
    String newMemberPassword = request.getParameter("newMemberPwd");
    String newMemberGender = request.getParameter("newMemberGender");

    // Update for "knowledge" Table
    String knowledgeId = request.getParameter("knowledgeId");
    String newKnowledgeImgpath = request.getParameter("newKnowledgeImgpath");
    String newKnowledgeName = request.getParameter("newKnowledgeName");
    String newKnowledgeType = request.getParameter("newKnowledgeType");
    String newKnowledgeClassification = request.getParameter("newKnowledgeClassification");

    // Update for "store" Table
    String storeId = request.getParameter("storeId");
    String newStoreImagePath = request.getParameter("newStoreImgpath");
    String newStoreName = request.getParameter("newStoreName");
    String newStoreList = request.getParameter("newStoreList");
    String newStorePrice = request.getParameter("newStorePrice");

    // Update for "Sugardaddy" Table
    String sugardaddyId = request.getParameter("sugardaddyId");
    String newSugardaddyImagepath = request.getParameter("newSugardaddyImagepath");
    String newSugardaddyName = request.getParameter("newSugardaddyName");
    String newSugardaddyHref = request.getParameter("newSugardaddyHref");

    // Update for "fun" Table
    String funId = request.getParameter("funId");
    String newFunimagePathicon = request.getParameter("newFunimagePathicon");
    String newFunName = request.getParameter("newFunName");
    String newFunClassification = request.getParameter("newFunClassification");
    String newFunPlace = request.getParameter("newFunPlace");
    String newFunPhone = request.getParameter("newFunPhone");


    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {


            // Update for "member" Table
            String updateMemberQuery = "UPDATE member SET id=?, name=?, pwd=?, gender=? WHERE id=?";
            try (PreparedStatement pstmtMember = conn.prepareStatement(updateMemberQuery)) {
                pstmtMember.setString(1, newMemberId);
                pstmtMember.setString(2, newMemberName);
                pstmtMember.setString(3, newMemberPassword);
                pstmtMember.setString(4, newMemberGender);
                pstmtMember.setString(5, memberId);

                int memberRowsUpdated = pstmtMember.executeUpdate();

                // Check if rows were updated for "Member" Table
                if (memberRowsUpdated > 0) {
%>
                    <script>
                        alert("Member update successful!");
                        window.location.href = "cms.jsp";
                    </script>
<%
                    return;  // End the script execution here
                }
            }

            // Update for "knowledge" Table
            String updateKnowledgeQuery = "UPDATE knowledge SET image_path=?, name=?, type=?, classification=? WHERE id=?";
            try (PreparedStatement pstmtKnowledge = conn.prepareStatement(updateKnowledgeQuery)) {
                pstmtKnowledge.setString(1, newKnowledgeImgpath);
                pstmtKnowledge.setString(2, newKnowledgeName);
                pstmtKnowledge.setString(3, newKnowledgeType);
                pstmtKnowledge.setString(4, newKnowledgeClassification);
                pstmtKnowledge.setString(5, knowledgeId);

                int knowledgeRowsUpdated = pstmtKnowledge.executeUpdate();

                // Check if rows were updated for "knowledge" Table
                if (knowledgeRowsUpdated > 0) {
%>
                    <script>
                        alert("Knowledge update successful!");
                        window.location.href = "cms.jsp";
                    </script>
<%
                    return;  // End the script execution here
                }
            }

            // Update for "store" Table
            String updateStoreQuery = "UPDATE store SET imgpath=?, name=?, list=?, price=? WHERE id=?";
            try (PreparedStatement pstmtStore = conn.prepareStatement(updateStoreQuery)) {
                pstmtStore.setString(1, newStoreImagePath);
                pstmtStore.setString(2, newStoreName);
                pstmtStore.setString(3, newStoreList);
                pstmtStore.setString(4, newStorePrice);
                pstmtStore.setString(5, storeId);

                int storeRowsUpdated = pstmtStore.executeUpdate();

                // Check if rows were updated for "store" Table
                if (storeRowsUpdated > 0) {
%>
                    <script>
                        alert("Store update successful!");
                        window.location.href = "cms.jsp";
                    </script>
<%
                    return;  // End the script execution here
                }
            }

            // Update for "Sugardaddy" Table
            String updateSugardaddyQuery = "UPDATE sugardaddy SET imagepath=?, name=?, href=? WHERE id=?";
            try (PreparedStatement pstmtSugardaddy = conn.prepareStatement(updateSugardaddyQuery)) {
                pstmtSugardaddy.setString(1, newSugardaddyImagepath);
                pstmtSugardaddy.setString(2, newSugardaddyName);
                pstmtSugardaddy.setString(3, newSugardaddyHref);
                pstmtSugardaddy.setString(4, sugardaddyId);

                int SugardaddyRowsUpdated = pstmtSugardaddy.executeUpdate();

                // Check if rows were updated for "Sugardaddy" Table
                if (SugardaddyRowsUpdated > 0) {
%>
                    <script>
                        alert("Sugardaddy update successful!");
                        window.location.href = "cms.jsp";
                    </script>
<%
                    return;  // End the script execution here
                }
            }

            // Update for "Fun" Table
            String updateFunQuery = "UPDATE fun SET imagePathicon=?, name=?, classification=?, place=?, phone=? WHERE id=?";
            try (PreparedStatement pstmtFun = conn.prepareStatement(updateFunQuery)) {
                pstmtFun.setString(1, newFunimagePathicon);
                pstmtFun.setString(2, newFunName);
                pstmtFun.setString(3, newFunClassification);
                pstmtFun.setString(4, newFunPlace);
                pstmtFun.setString(5, newFunPhone);
                pstmtFun.setString(6, funId);

                int FunRowsUpdated = pstmtFun.executeUpdate();

                // Check if rows were updated for "Fun" Table
                if (FunRowsUpdated > 0) {
%>
                    <script>
                        alert("Fun update successful!");
                        window.location.href = "cms.jsp";
                    </script>
                    <%
                    return;  
                }
            }
            %>
            <script>
                alert("No rows updated. Check your parameters.");
                window.location.href = "cms.jsp";
            </script>
<%
        }
    } catch (SQLException se) {
        se.printStackTrace();
%>
    <script>
        alert("SQL Exception: <%= se.getMessage() %>");
        window.location.href = "cms.jsp";
    </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
    <script>
        alert("Error updating rows: <%= e.getMessage() %>");
        window.location.href = "cms.jsp";
    </script>
<%
    }
%>
