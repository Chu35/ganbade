<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% 
    String memberName = (String) session.getAttribute("memberName"); 
%>
<head>
    <!-- Include SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%    
    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
    String user = "chu";
    String password = "0725";

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
            if ("store".equals(request.getParameter("dataType"))) {
                String newStoreId = request.getParameter("newId");
                String newStoreImgpath = request.getParameter("newImgpath");
                String newStoreName = request.getParameter("newName");
                String newStorePrice = request.getParameter("newPrice");
                String newStoreList = request.getParameter("newList");

                String insertStoreQuery = "INSERT INTO store (id, imgpath, name, list, price) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmtStore = conn.prepareStatement(insertStoreQuery)) {
                    pstmtStore.setString(1, newStoreId);
                    pstmtStore.setString(2, newStoreImgpath);
                    pstmtStore.setString(3, newStoreName);
                    pstmtStore.setString(4, newStoreList);
                    pstmtStore.setString(5, newStorePrice);
                    int rowsInsertedStore = pstmtStore.executeUpdate();

                    if (rowsInsertedStore > 0) {
%>
                        <script>
                            Swal.fire({
                                title: 'Store Data Inserted Successfully!',
                                icon: 'success',
                                timer: 1000,
                                timerProgressBar: true,
                                showConfirmButton: false
                            });
                        </script>
<%
                    } else {
%>
                        <script>
                            Swal.fire({
                                title: 'Error Inserting Store Data',
                                icon: 'error',
                                text: 'No rows inserted for Store.',
                                timer: 3000,
                                timerProgressBar: true,
                                showConfirmButton: false
                            });
                        </script>
<%
                    }
                } catch (SQLException eStore) {
                    eStore.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
%>
                    <script>
                        Swal.fire({
                            title: 'SQL Exception (Store): <%= eStore.getMessage() %>',
                            icon: 'error',
                            timer: 3000,
                            timerProgressBar: true,
                            showConfirmButton: false
                        });
                    </script>
<%
                }
            }

            // Insert operations for "sugardaddy"
            if ("sugardaddy".equals(request.getParameter("dataType"))) {
                String newSugardaddyId = request.getParameter("newId");
                String newSugardaddyImagepath = request.getParameter("newImagepath");
                String newSugardaddyName = request.getParameter("newName");
                String newSugardaddyHref = request.getParameter("newHref");

                String insertSugardaddyQuery = "INSERT INTO sugardaddy (id, imagepath, name, href) VALUES (?, ?, ?, ?)";
                try (PreparedStatement pstmtSugardaddy = conn.prepareStatement(insertSugardaddyQuery)) {
                    pstmtSugardaddy.setString(1, newSugardaddyId);
                    pstmtSugardaddy.setString(2, newSugardaddyImagepath);
                    pstmtSugardaddy.setString(3, newSugardaddyName);
                    pstmtSugardaddy.setString(4, newSugardaddyHref);
                    int rowsInsertedSugardaddy = pstmtSugardaddy.executeUpdate();

                    if (rowsInsertedSugardaddy > 0) {
%>
                        <script>
                            Swal.fire({
                                title: 'Sugardaddy Data Inserted Successfully!',
                                icon: 'success',
                                timer: 1000,
                                timerProgressBar: true,
                                showConfirmButton: false
                            });
                        </script>
<%
                    } else {
%>
                        <script>
                            Swal.fire({
                                title: 'Error Inserting Sugardaddy Data',
                                icon: 'error',
                                text: 'No rows inserted for Sugardaddy.',
                                timer: 3000,
                                timerProgressBar: true,
                                showConfirmButton: false
                            });
                        </script>
<%
                    }
                } catch (SQLException eSugardaddy) {
                    eSugardaddy.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
%>
                    <script>
                        Swal.fire({
                            title: 'SQL Exception (Sugardaddy): <%= eSugardaddy.getMessage() %>',
                            icon: 'error',
                            timer: 3000,
                            timerProgressBar: true,
                            showConfirmButton: false
                        });
                    </script>
<%
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
%>
            <script>
                Swal.fire({
                    title: 'Error: <%= e.getMessage() %>',
                    icon: 'error',
                    timer: 3000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
            </script>
<%
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
%>
        <script>
            Swal.fire({
                title: 'Error: <%= e.getMessage() %>',
                icon: 'error',
                timer: 3000,
                timerProgressBar: true,
                showConfirmButton: false
            });
        </script>
<%
    }
%>
</body>
</html>