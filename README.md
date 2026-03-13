<<<<<<< HEAD
# labtest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Product Requirement Document (PRD)

## Smart Class Check-in & Learning Reflection App

---

## 1. Problem Statement

In many classrooms, attendance is usually taken by calling names or asking students to sign a paper sheet. This traditional method is not very efficient and makes it difficult for instructors to confirm whether students are actually present in the classroom.

For example, some students may check in for their friends, or they may leave the classroom after checking in. Because of this, instructors cannot always be sure that students are truly attending the class.

Another limitation of traditional attendance systems is that they only record whether a student is present or absent. They do not encourage students to reflect on what they learned during the class.

This project aims to develop a simple mobile application that allows students to check in to class using their smartphones. The system will use GPS location and QR code scanning to help verify that students are physically in the classroom. In addition, the application will encourage students to write a short reflection after class so they can think about what they learned.

---

## 2. Target Users

The main users of this application are university students who need to check in for class attendance. The application helps them check in quickly and conveniently using their mobile phones.

Instructors can also benefit from this system because it makes it easier to confirm student attendance and understand students’ learning experiences through their reflections and feedback.

---

## 3. Feature List

The application will include several main features:

### 3.1 Check-in System
Students can check in before the class starts by pressing a **Check-in** button in the application. The system will record the student’s GPS location and the current time.

### 3.2 QR Code Verification
Students must scan a QR code provided by the instructor to confirm that they are physically present in the classroom.

### 3.3 Pre-Class Check-in Form
Students will fill in a short form that includes:

- The topic covered in the previous class  
- What they expect to learn in the current class
-   
### 3.4 Mood Scale
Students will select their mood before the class using the following scale:

| Score | Mood | Description |
|------|------|-------------|
| 1 | 😡 | Very negative |
| 2 | 😟 | Negative |
| 3 | 😐 | Neutral |
| 4 | 🙂 | Positive |
| 5 | 😄 | Very positive |

This mood data will help instructors understand students' emotional state before the class starts.

### 3.5 End-of-Class Reflection
After the class finishes, students will press **Finish Class** in the application. The system will again ask them to scan the QR code and record their GPS location.

Students will then write a short reflection about:

- What they learned during the class  
- Any feedback they want to give about the class or the instructor  

---

## 4. User Flow

The basic process of using the application is as follows:

1. The student opens the application and presses the **Check-in** button.  
2. The system records the student’s GPS location.  
3. The student scans the QR code provided by the instructor.  
4. The student fills in the check-in form (previous topic, expected topic, and mood).  
5. At the end of the class, the student opens the application again and presses **Finish Class**.  
6. The student scans the QR code again and writes a short reflection about what they learned and any feedback about the class.

---

## 5. Data Fields

The application will store several pieces of information, including:

- Student ID  
- Timestamp of check-in and check-out  
- GPS location  
- Previous class topic  
- Expected topic for the current class  
- Student mood before class  
- What the student learned during the class  
- Feedback about the class  

---

## 6. Technology Stack

The mobile application will be developed using **Flutter**.

For the MVP (Minimum Viable Product) version, student data will be stored using **local storage or SQLite**.

**Firebase** may be used for hosting or deployment, especially for the web version of the application.

---
>>>>>>> 9568f770c98038945f1385876bef3888168350a2
