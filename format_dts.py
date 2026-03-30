import subprocess

def get_staged_files():
    result = subprocess.run(['hg', 'status', '-man'], stdout=subprocess.PIPE)
    files = result.stdout.decode('utf-8').split('\n')
    return [f for f in files if f.endswith('.dts')]

def format_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    formatted_lines = []
    for line in lines:
        stripped_line = line.lstrip()
        if stripped_line.startswith('#') or stripped_line.startswith('&'):
            formatted_lines.append(line)
        else:
            leading_spaces = len(line) - len(stripped_line)
            leading_tabs = leading_spaces // 8
            formatted_line = '\t' * leading_tabs + stripped_line
            formatted_lines.append(formatted_line)

    with open(file_path, 'w') as file:
        file.writelines(formatted_lines)

def main():
    staged_files = get_staged_files()
    for file in staged_files:
        format_file(file)

if __name__ == "__main__":
    main()