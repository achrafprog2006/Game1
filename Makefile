# Compiler and Flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -g
LIBS = -lglfw -lGLEW -lGL -lm

# Source files
SRCS = $(wildcard src/*.cpp)
OBJS = $(SRCS:.cpp=.o)

# Output executable name
TARGET =bin/Game1

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LIBS)

# Compile each .cpp file into a .o file
%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(TARGET)
