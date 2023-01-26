Some notes about the decisions I made when structuring this:
- I decided to put the main translation logic into a view (vw_TranslatedPerson) so that I could see the conversion without inserting it into the table
- I decided to add the States table and the functions as separate objects from the main view because they would be usable by other imports
- The stored procedure that does the actual insert is trivial, but I needed to show the actual insert somewhere
- I used the Generate Scripts function in SSMS to export these objects from the DB where I was working.  This allowed me to both include the data for the states table and to avoid installing Visual Studio on my home computer.  At work, I would normally use SSDT to turn database objects into files.

And within the view:
- I decided to use the existing vw_CODY_PersonPhysicalFeatureTable that could potentially return duplicates, because we could potentially be at a stage in the conversion where we want duplicates to come back so that we can identify them and determine what to do with them.
- I decided to define a translation table only for the Build Code/Desc values because those are the only ones that I had any reason to translate at all.  This probably wouldn't be the case in a normal conversion.
- I used a pivot to flatten the phone number list even though it eliminates duplicates, because this is the opposite of the decision that was made when I decided to use vw_CODY_PersonPhysicalFeaturesTable.  I intentionally decided to show both options, for the purpose of the exercise, even though a real conversion wouldn't be inconsistent about generating or ignoring duplicates like that.
 
