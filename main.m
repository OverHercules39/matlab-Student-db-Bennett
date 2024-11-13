# main.m

clear;
clc;

% Create the student database
database = StudentDatabase();

% Add sample students
database = database.addStudent(Student('001', 'Jason', 19, 4.0, 'Engineering'));
database = database.addStudent(Student('002', 'Josh', 22, 3.2, 'Physics'));
database = database.addStudent(Student('003', 'Charlie', 22, 1.0, 'Chemistry'));
database = database.addStudent(Student('004', 'Dana', 23, 2.9, 'Engineering'));
database = database.addStudent(Student('005', 'Eve', 24, 3.5, 'Computer Science'));

% Save and load the database
database.saveDatabase('studentDB.mat');
database = database.loadDatabase('studentDB.mat');

% Display information for each student
for i = 1:length(database.Students)
    database.Students(i).displayInfo();
end

% Find and display a specific student by ID
foundStudent = database.findStudentByID('003');
if ~isempty(foundStudent)
    foundStudent.displayInfo();
end

% Plot GPA distribution
figure;
gpas = arrayfun(@(s) s.GPA, database.Students);
histogram(gpas, 'FaceColor', 'b');
title('GPA Distribution');
xlabel('GPA');
ylabel('Frequency');

% Plot average GPA by major
figure;
majors = unique({database.Students.Major});
avgGPA = zeros(1, length(majors));
for i = 1:length(majors)
    gpaList = gpas(strcmp({database.Students.Major}, majors{i}));
    avgGPA(i) = mean(gpaList);
end
bar(categorical(majors), avgGPA);
title('Average GPA by Major');
xlabel('Major');
ylabel('Average GPA');

% Plot age distribution
figure;
ages = arrayfun(@(s) s.Age, database.Students);
histogram(ages, 'FaceColor', 'r');
title('Age Distribution');
xlabel('Age');
ylabel('Frequency');
