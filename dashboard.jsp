<%@ page import="java.util.List" %>
<%@ page import="com.example.assignment02.model.Expense" %>
<%@ page import="com.example.assignment02.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");

    String username = "User";

    if (loggedUser != null) {
        username = loggedUser.getName();
        if (username == null || username.trim().isEmpty()) {
            username = loggedUser.getEmail();
        }

    }

    List<Expense> expenses =
            (List<Expense>) request.getAttribute("expenses");

    Object incomeObj = request.getAttribute("totalIncome");
    Object expenseObj = request.getAttribute("totalExpense");

    double totalIncome = incomeObj != null
            ? ((Number) incomeObj).doubleValue()
            : 0.0;

    double totalExpense = expenseObj != null
            ? ((Number) expenseObj).doubleValue()
            : 0.0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expense Dashboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f8fafc;
            color: #1e293b;
        }

        .header {
            background: white;
            padding: 20px 35px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
        }

        .export-btn {
            background: #ea580c;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        .main-content {
            padding: 35px;
            max-width: 1200px;
            margin: auto;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 320px;
            gap: 25px;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.08);
        }

        .card-title {
            font-size: 15px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #374151;
        }

        .amount {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .change {
            color: #10b981;
            font-size: 14px;
        }

        .my-card {
            background: linear-gradient(135deg, #059669, #10b981);
            color: white;
        }

        .chip {
            width: 35px;
            height: 25px;
            background: #fbbf24;
            border-radius: 5px;
            margin: 20px 0;
        }

        .card-number {
            letter-spacing: 3px;
            font-size: 18px;
            margin-bottom: 15px;
        }

        .progress {
            height: 7px;
            background: rgba(255,255,255,0.4);
            border-radius: 5px;
            margin-top: 10px;
        }

        .progress-fill {
            height: 100%;
            width: 40%;
            background: #ea580c;
            border-radius: 5px;
        }

        .chart-section {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

        .overview-card,
        .expenses-card {
            min-height: 330px;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .overview-actions {
            display: flex;
            gap: 10px;
        }

        .chart {
            height: 270px;
            background: #f8fafc;
            border-radius: 10px;
            display: flex;
            align-items: end;
            justify-content: space-between;
            padding: 30px 20px 15px;
            margin-top: 15px;
        }

        .chart-item {
            height: 230px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: end;
            gap: 16px;
            position: relative;
        }

        .chart-item span {
            font-size: 13px;
            color: #64748b;
        }

        .bar {
            width: 36px;
            background: #e5e7eb;
            border-radius: 5px 5px 0 0;
        }

        .active-bar {
            width: 36px;
            height: 160px;
            display: flex;
            flex-direction: column;
            justify-content: end;
        }

        .income-part {
            height: 55px;
            background: #10b981;
            border-radius: 5px 5px 0 0;
        }

        .expense-part {
            height: 80px;
            background: #f97316;
            border-radius: 0 0 5px 5px;
        }

        .tooltip {
            position: absolute;
            top: 0;
            background: white;
            padding: 8px 10px;
            border-radius: 6px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
            font-size: 12px;
            z-index: 5;
        }

        .tooltip p {
            margin: 2px 0;
        }

        .green {
            color: #10b981;
        }

        .orange {
            color: #f97316;
        }

        .total-expense {
            margin: 20px 0;
            font-size: 32px;
        }

        .period-tabs,
        .period-labels,
        .period-values {
            display: flex;
            justify-content: space-between;
            margin: 14px 0;
        }

        .period-tabs span,
        .period-labels span {
            color: #64748b;
        }

        .active-tab {
            color: #1e293b !important;
            font-weight: bold;
        }

        .color-bar {
            height: 6px;
            border-radius: 10px;
            background: linear-gradient(to right, #f97316, #facc15, #22c55e);
            margin: 18px 0;
        }

        .category-row {
            display: flex;
            justify-content: space-between;
            padding: 11px 0;
            border-bottom: 1px solid #f1f5f9;
        }

        .dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-right: 8px;
        }

        .orange-dot {
            background: #f97316;
        }

        .yellow-dot {
            background: #f59e0b;
        }

        .gold-dot {
            background: #eab308;
        }

        .green-dot {
            background: #10b981;
        }

        .dots {
            color: #9ca3af;
            font-weight: bold;
        }

        .transactions-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .transactions-table th,
        .transactions-table td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        .transactions-table th {
            color: #64748b;
            font-size: 14px;
        }

        .status-success {
            background: #dcfce7;
            color: #16a34a;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
        }

        .btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 11px 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-expense {
            background: #ef4444;
        }

        .delete-btn {
            background: none;
            border: none;
            color: #ef4444;
            cursor: pointer;
            font-weight: bold;
        }

        @media(max-width: 900px) {
            .dashboard-grid,
            .chart-section,
            .forms-grid {
                grid-template-columns: 1fr;
            }
        }

        .add-buttons {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .fab {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            border: none;
            color: white;
            font-size: 28px;
            cursor: pointer;
        }

        .fab-income {
            background: #10b981;
        }

        .fab-expense {
            background: #ef4444;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            inset: 0;
            background: rgba(0,0,0,0.45);
        }

        .modal-content {
            background: white;
            width: 430px;
            max-width: 90%;
            margin: 120px auto;
            border-radius: 12px;
            overflow: hidden;
        }

        .modal-header {
            padding: 20px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-body label {
            margin-top: 12px;
        }

        .modal-footer {
            padding: 18px;
            border-top: 1px solid #e5e7eb;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .close-btn {
            border: none;
            background: none;
            font-size: 24px;
            cursor: pointer;
        }

        .cancel-btn {
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        .submit-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
        }
        .chart {
            height: 300px;
            background: #f8fafc;
            border-radius: 10px;
            display: flex;
            align-items: end;
            justify-content: space-around;
            padding: 30px 20px 20px;
            position: relative;
        }

        .chart-item {
            height: 240px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: end;
            gap: 18px;
            position: relative;
        }

        .chart-item span {
            font-size: 13px;
            color: #64748b;
        }

        .bar {
            width: 38px;
            background: #e5e7eb;
            border-radius: 5px 5px 0 0;
        }

        .active-bar {
            width: 38px;
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: end;
        }

        .income-part {
            height: 80px;
            background: #10b981;
            border-radius: 5px 5px 0 0;
        }

        .expense-part {
            height: 80px;
            background: #f97316;
            border-radius: 0 0 5px 5px;
        }

        .tooltip {
            position: absolute;
            top: 0;
            background: white;
            padding: 8px 10px;
            border-radius: 6px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
            font-size: 12px;
            z-index: 5;
        }

        .tooltip p {
            margin: 2px 0;
        }

        .green {
            color: #10b981;
        }

        .orange {
            color: #f97316;
        }
        .header-controls {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .top-btn {
            background: white;
            border: 1px solid #d1d5db;
            padding: 10px 16px;
            border-radius: 8px;
            cursor: pointer;
            color: #1e293b;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>Good Morning, <%= username %>!</h1>

    <div class="header-controls">
        <button class="top-btn">Daily &#9662;</button>
        <button class="top-btn">13 May 2026</button>
        <button class="export-btn">Export</button>
    </div>
</div>

<div class="main-content">

    <div class="dashboard-grid">

        <div class="card">
            <div class="card-title">Monthly Income</div>
            <div class="amount">$<%= totalIncome %></div>
            <div class="change">&uarr; 12% vs Last month</div>
        </div>

        <div class="card">
            <div class="card-title">Monthly Expenses</div>
            <div class="amount">$<%= totalExpense %></div>
            <div class="change">&uarr; 12% vs Last month</div>
        </div>

        <div class="card my-card">
            <div class="card-title">My Card</div>
            <p>Linked to your primary wallet</p>
            <div class="chip"></div>
            <div class="card-number">5435 2735 0037 0015</div>
            <p><%= username %></p>

            <br>
            <p>Spending Limit</p>
            <div class="spending-limit">$<%= totalIncome - totalExpense %></div>
            <small>remaining from $<%= totalIncome %></small>

            <div class="progress">
                <div class="progress-fill"></div>
            </div>
        </div>

    </div>

    <div class="chart-section">

        <!-- Overview Card -->
        <div class="card overview-card">
            <div class="card-header">
                <div class="card-title">Overview</div>

                <div class="overview-actions">
                    <button class="top-btn">Yearly &#9662;</button>
                    <button class="top-btn">Filter</button>
                </div>
            </div>

            <div class="chart">
                <div class="chart-item">
                    <div class="bar" style="height:120px;"></div>
                    <span>Feb</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:80px;"></div>
                    <span>Mar</span>
                </div>

                <div class="chart-item active-chart">
                    <div class="tooltip">
                        <strong>April<br>2025</strong>
                        <p class="green">Income:<br>$894</p>
                        <p class="orange">Expenses:<br>$768</p>
                    </div>

                    <div class="active-bar">
                        <div class="income-part"></div>
                        <div class="expense-part"></div>
                    </div>

                    <span>Apr</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:150px;"></div>
                    <span>Mei</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:90px;"></div>
                    <span>Jun</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:110px;"></div>
                    <span>Jul</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:130px;"></div>
                    <span>Aug</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:100px;"></div>
                    <span>Sep</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:85px;"></div>
                    <span>Oct</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:160px;"></div>
                    <span>Nov</span>
                </div>

                <div class="chart-item">
                    <div class="bar" style="height:95px;"></div>
                    <span>Des</span>
                </div>
            </div>
        </div>

        <!-- All Expenses Card -->
        <div class="card expenses-card">
            <div class="card-header">
                <div class="card-title">All Expenses</div>
                <span class="dots">...</span>
            </div>

            <small>Spending breakdown by category</small>

            <h1 class="total-expense">$<%= totalExpense %></h1>

            <div class="period-tabs">
                <span>Daily</span>
                <span>Weekly</span>
                <span class="active-tab">Monthly</span>
            </div>

            <div class="period-labels">
                <span>Daily</span>
                <span>Weekly</span>
                <span>Monthly</span>
            </div>

            <div class="period-values">
                <strong>$1,345</strong>
                <strong>$7,136</strong>
                <strong>$14,927</strong>
            </div>

            <div class="color-bar"></div>

            <div class="category-row">
                <span><span class="dot orange-dot"></span>Food & Health</span>
                <span>863</span>
            </div>

            <div class="category-row">
                <span><span class="dot yellow-dot"></span>Entertainments</span>
                <span>248</span>
            </div>

            <div class="category-row">
                <span><span class="dot gold-dot"></span>Shopping</span>
                <span>1835</span>
            </div>

            <div class="category-row">
                <span><span class="dot green-dot"></span>Investment</span>
                <span>1835</span>
            </div>
        </div>

    </div>

    <div class="card">
        <div class="card-title">Recent Transactions</div>

        <table class="transactions-table">
            <thead>
            <tr>
                <th>Date</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <%
                if (expenses != null && !expenses.isEmpty()) {
                    for (Expense e : expenses) {
            %>
            <tr>
                <td><%= e.getDate() %></td>
                <td><%= e.getCategory() %></td>

                <td style="color:<%= "income".equalsIgnoreCase(e.getType()) ? "#10b981" : "#ef4444" %>;">
                    <%= "income".equalsIgnoreCase(e.getType()) ? "+" : "-" %>
                    $<%= e.getAmount() %>
                </td>

                <td>
                    <span class="status-success">Success</span>
                </td>

                <td>
                    <form action="dashboard" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= e.getId() %>">
                        <button class="delete-btn" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No transactions yet.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div id="incomeModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add Income</h2>
                <button onclick="closeModal('incomeModal')" class="close-btn">&#10005;</button>
            </div>

            <form action="dashboard" method="post">
                <div class="modal-body">
                    <input type="hidden" name="type" value="income">

                    <label>Amount</label>
                    <input type="number" name="amount" placeholder="Enter amount" required>

                    <label>Category</label>
                    <select name="category" required>
                        <option value="">Select category</option>
                        <option value="Salary">Salary</option>
                        <option value="Freelance">Freelance</option>
                        <option value="Business">Business</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Description</label>
                    <input type="text" name="description" placeholder="Enter description">

                    <label>Date</label>
                    <input type="date" name="date" required>
                </div>

                <div class="modal-footer">
                    <button type="button" onclick="closeModal('incomeModal')" class="cancel-btn">Cancel</button>
                    <button type="submit" class="submit-btn">Add Income</button>
                </div>
            </form>
        </div>
    </div>

    <div id="expenseModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add Expense</h2>
                <button onclick="closeModal('expenseModal')" class="close-btn">&#10005;</button>
            </div>

            <form action="dashboard" method="post">
                <div class="modal-body">
                    <input type="hidden" name="type" value="expense">

                    <label>Amount</label>
                    <input type="number" name="amount" placeholder="Enter amount" required>

                    <label>Category</label>
                    <select name="category" required>
                        <option value="">Select category</option>
                        <option value="Food & Health">Food & Health</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Transport">Transport</option>
                        <option value="Bills">Bills</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Description</label>
                    <input type="text" name="description" placeholder="Enter description">

                    <label>Date</label>
                    <input type="date" name="date" required>
                </div>

                <div class="modal-footer">
                    <button type="button" onclick="closeModal('expenseModal')" class="cancel-btn">Cancel</button>
                    <button type="submit" class="submit-btn">Add Expense</button>
                </div>
            </form>
        </div>
    </div>

    <div class="add-buttons">
        <button class="fab fab-income" onclick="openModal('incomeModal')">+</button>
        <button class="fab fab-expense" onclick="openModal('expenseModal')">&minus;</button>
    </div>

</div>
<script>
    function openModal(id) {
        document.getElementById(id).style.display = "block";
    }

    function closeModal(id) {
        document.getElementById(id).style.display = "none";
    }

    window.onclick = function(event) {
        const incomeModal = document.getElementById("incomeModal");
        const expenseModal = document.getElementById("expenseModal");

        if (event.target === incomeModal) {
            closeModal("incomeModal");
        }

        if (event.target === expenseModal) {
            closeModal("expenseModal");
        }
    }
</script>


</body>
</html>