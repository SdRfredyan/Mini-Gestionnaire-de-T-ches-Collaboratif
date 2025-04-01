
package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/task")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Task> tasks = (List<Task>) session.getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
            session.setAttribute("tasks", tasks);
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dueDate = request.getParameter("dueDate");
            tasks.add(new Task(title, description, dueDate));
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.remove(index);
        } else if ("complete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            tasks.get(index).setCompleted(true);
        }

        response.sendRedirect("tasks.jsp");
    }
}
