#!/usr/bin/env texlua

module = "pdfcrop"

maindir = "."
textfiles = {"README.md","LICENCE"}
sourcefiles = {"pdfcrop.pl"}
installfiles = {"*.pl"}
scriptfiles = {"*.pl"}
ctanreadme = "README.md"

packtdszip = false

function update_tag(file,content,tagname,tagdate)

local tagpattern="(%d%d%d%d[-/]%d%d[-/]%d%d) v(%d+[.])(%d+)"
local oldv,newv
if tagname == 'auto' then
  local i,j,olddate,a,b
  i,j,olddate,a,b= string.find(content, tagpattern)
  if i == nil then
    print('OLD TAG NOT FOUND')
    return content
  else
    print ('FOUND: ' .. olddate .. ' v' .. a .. b )
    oldv = olddate .. ' v' .. a .. b
    newv = tagdate .. ' v'  .. a .. math.floor(b + 1)
    print('USING OLD TAG: ' .. oldv)
    print('USING NEW TAG: ' .. newv)
    local oldpattern = string.gsub(oldv,"[-/]", "[-/]")
    content=string.gsub(content,oldpattern,newv)
    return content
  end
else
  error("only automatic tagging supported")
end

end

-- Create make_temp_dir() function
local function make_temp_dir()
  local tmpname = os.tmpname()
  tempdir = basename(tmpname)
  print("** Creating the temporary directory ./"..tempdir)
  errorlevel = mkdir(tempdir)
  if errorlevel ~= 0 then
    error("** Error!!: The ./"..tempdir.." directory could not be created")
    return errorlevel
  end
end

-- Add "testpkg" target to l3build CLI
if options["target"] == "testpkg" then
  make_temp_dir()
  -- Copy script
  local pdfcrop = "pdfcrop.pl"
  print("** Copying "..pdfcrop.." from "..maindir.." to ./"..tempdir)
  errorlevel = cp(pdfcrop, maindir, tempdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy "..pdfcrop.." from "..maindir.." to /"..tempdir)
    return errorlevel
  end
  -- Check syntax
  print("** Running: perl -cw "..pdfcrop)
  errorlevel = run(tempdir, "perl -cw "..pdfcrop)
  if errorlevel ~= 0 then
    error("** Error!!: perl -cw "..script)
    return errorlevel
  end
  -- Copy test files
  print("** Copying files from ./tests to ./"..tempdir)
  errorlevel = cp("*.*", "./tests", tempdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy files from ./tests to /"..tempdir)
  end
  -- Run a simple test
  print("** Running: perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
  errorlevel = run(tempdir, "perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
  if errorlevel ~= 0 then
    error("** Error!!: perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
    return errorlevel
  end
  -- We can copy the output or do other operations
  print("** Copying result from ./"..tempdir.." to "..maindir)
  errorlevel = cp("*-crop.pdf", tempdir, maindir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy files from ./"..tempdir.." to "..maindir)
  end
  -- Clean files
  print("** Remove temporary directory ./"..tempdir)
  --cleandir(tempdir)
  --lfs.rmdir(tempdir)
  os.exit()
end
