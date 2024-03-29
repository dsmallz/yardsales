// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.Tag;
import com.ksl.yardsales.domain.TagDataOnDemand;
import com.ksl.yardsales.domain.TagIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TagIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TagIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TagIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TagIntegrationTest: @Transactional;
    
    @Autowired
    TagDataOnDemand TagIntegrationTest.dod;
    
    @Test
    public void TagIntegrationTest.testCountTags() {
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = Tag.countTags();
        Assert.assertTrue("Counter for 'Tag' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TagIntegrationTest.testFindTag() {
        Tag obj = dod.getRandomTag();
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        obj = Tag.findTag(id);
        Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Tag' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TagIntegrationTest.testFindAllTags() {
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = Tag.countTags();
        Assert.assertTrue("Too expensive to perform a find all test for 'Tag', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Tag> result = Tag.findAllTags();
        Assert.assertNotNull("Find all method for 'Tag' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Tag' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TagIntegrationTest.testFindTagEntries() {
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = Tag.countTags();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Tag> result = Tag.findTagEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Tag' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Tag' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TagIntegrationTest.testFlush() {
        Tag obj = dod.getRandomTag();
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        obj = Tag.findTag(id);
        Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTag(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Tag' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TagIntegrationTest.testMergeUpdate() {
        Tag obj = dod.getRandomTag();
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        obj = Tag.findTag(id);
        boolean modified =  dod.modifyTag(obj);
        Integer currentVersion = obj.getVersion();
        Tag merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Tag' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TagIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        Tag obj = dod.getNewTransientTag(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Tag' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Tag' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Tag' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TagIntegrationTest.testRemove() {
        Tag obj = dod.getRandomTag();
        Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        obj = Tag.findTag(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Tag' with identifier '" + id + "'", Tag.findTag(id));
    }
    
}
