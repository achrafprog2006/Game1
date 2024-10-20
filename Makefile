# Compiler and Flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -g
LIBS = -lglfw -lGLEW -lGL -lm

# Source files
SRCS = $(wildcard src/*.cpp)
OBJS = $(patsubst src/%.cpp, $(OBJDIR)/%.o, $(SRCS))  # Place .o files in the bin directory
OBJDIR = bin

# Output executable name
TARGET = build/Game1

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LIBS)

# Compile each .cpp file into a .o file in the OBJDIR
$(OBJDIR)/%.o: src/%.cpp
	@mkdir -p $(OBJDIR)  # Create OBJDIR if it doesn't exist
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(TARGET)
