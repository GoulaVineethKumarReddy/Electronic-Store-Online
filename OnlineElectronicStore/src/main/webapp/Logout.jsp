<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out - ElectroStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow: hidden;
        }

        .logout-container {
            background: rgba(255, 255, 255, 0.97);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 30px 70px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 520px;
            text-align: center;
            padding: 60px 40px;
            animation: fadeInUp 0.8s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logout-icon {
            font-size: 6rem;
            color: #43e97b;
            margin-bottom: 25px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-25px); }
            60% { transform: translateY(-15px); }
        }

        h1 {
            font-size: 2.8rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        p {
            font-size: 1.3rem;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .countdown {
            font-size: 1.4rem;
            color: #667eea;
            font-weight: 600;
            margin: 25px 0;
        }

        .home-btn {
            display: inline-block;
            padding: 16px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            font-size: 1.3rem;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.4s ease;
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.4);
        }

        .home-btn:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(102, 126, 234, 0.5);
        }

        .home-btn i {
            margin-right: 10px;
        }

        @media (max-width: 480px) {
            .logout-icon { font-size: 4.5rem; }
            h1 { font-size: 2.2rem; }
            p { font-size: 1.1rem; }
            .home-btn { padding: 14px 30px; font-size: 1.1rem; }
        }
    </style>
</head>
<body>

<%
    // Invalidate session (logout user)
    session.invalidate();
%>

    <div class="logout-container">
        <div class="logout-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h1>Logged Out Successfully!</h1>
        <p>You have been securely logged out of your account.<br>Thank you for using ElectroStore.</p>
        
        <div class="countdown" id="countdown">Redirecting to homepage in <span id="timer">5</span> seconds...</div>

        <a href="index.html" class="home-btn">
            <i class="fas fa-home"></i> Back to Home
        </a>
    </div>

    <!-- Auto-redirect after 5 seconds -->
    <script>
        let timeLeft = 5;
        const timerElement = document.getElementById('timer');
        
        const countdown = setInterval(() => {
            timeLeft--;
            timerElement.textContent = timeLeft;
            
            if (timeLeft <= 0) {
                clearInterval(countdown);
                window.location.href = "index.html";
            }
        }, 1000);
    </script>

</body>
</html>