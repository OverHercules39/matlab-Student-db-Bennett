
% File: Student.m
classdef Student
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        % Constructor method
        function obj = Student(ID, Name, Age, GPA, Major)
            obj.ID = ID;
            obj.Name = Name;
            obj.Age = Age;
            obj.GPA = GPA;
            obj.Major = Major;
        end
        
        % Method to display student information
        function displayInfo(obj)
            fprintf('ID: %s\nName: %s\nAge: %d\nGPA: %.2f\nMajor: %s\n\n', ...
                obj.ID, obj.Name, obj.Age, obj.GPA, obj.Major);
        end
        
        % Method to update GPA
        function obj = updateGPA(obj, newGPA)
            obj.GPA = newGPA;
        end
    end
end
