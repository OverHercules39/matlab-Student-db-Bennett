% File: StudentDatabase.m
classdef StudentDatabase
    properties
        Students = []
    end
    
    methods
        % Method to add a student
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students; student];
        end
        
        % Method to find a student by ID
        function student = findStudentByID(obj, ID)
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).ID, ID)
                    student = obj.Students(i);
                    return;
                end
            end
            fprintf('Student with ID %s not found.\n', ID);
        end
        
        % Method to save the database to a file
        function saveDatabase(obj, filename)
            Students = obj.Students;
            save(filename, 'Students');
            fprintf('Database saved to %s.\n', filename);
        end
        
        % Method to load the database from a file
        function obj = loadDatabase(obj, filename)
            if isfile(filename)
                loadedData = load(filename, 'Students');
                obj.Students = loadedData.Students;
                fprintf('Database loaded from %s.\n', filename);
            else
                fprintf('File %s not found.\n', filename);
            end
        end
    end
end
